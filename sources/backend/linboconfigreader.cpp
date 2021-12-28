#include "linboconfigreader.h"
#include "linbobackend.h"

LinboConfigReader::LinboConfigReader(LinboBackend *backend) : QObject(backend)
{
    this->_backend = backend;
}

LinboConfig* LinboConfigReader::readConfig() {
    LinboConfig* config = new LinboConfig(this->_backend);
    this->_loadStartConf(config);
    this->_loadEnvironmentValues(config);
    this->_loadThemeConfig(this->_iconBasePath + "/" + config->themeConfFile(), config);
    return config;
}

bool LinboConfigReader::_loadStartConf(LinboConfig* config) {
    this->_backend->logger()->info("Starting to parse start.conf");

    QFile inputFile(this->_configFilePath);
    if(!this->_loadStartConf(&inputFile, config)) {
        this->_backend->logger()->error("Error opening the start.conf file: " + this->_configFilePath);
        return false;
    }
    else {
        this->_backend->logger()->info("Finished parsing start.conf");
        return true;
    }
}

bool LinboConfigReader::_loadStartConf(QFile *file, LinboConfig* config) {
    if (file->open(QIODevice::ReadOnly)) {
        QTextStream input(file);
        this->_loadStartConf(&input, config);
        file->close();
        return true;
    }
    else {
        return false;
    }
}

void LinboConfigReader::_loadStartConf(QTextStream *input, LinboConfig* config) {
    Block currentBlock = Block{"", {}};

    while(!input->atEnd()) {
        Line line = this->_parseLine(input->readLine());
        if(line.isNewBlock) {
            this->_loadConfigFromBlock(currentBlock, config);
            currentBlock = Block {
                this->_parseLineAsBlockName(line),
                {}
            };
        }
        else if(line.isKeyValuePair) {
            KeyValuePair keyValuePair = this->_parseLineAsKeyValuePair(line);
            currentBlock.config.insert(keyValuePair.key, keyValuePair.value);
        }
    }
}

LinboConfigReader::Line LinboConfigReader::_parseLine(QString line) {
    return Line {
        this->_isLineKeyValuePair(line),
        this->_isLineBlockName(line),
        this->_sanitizeLine(line)
    };
}

bool LinboConfigReader::_isLineKeyValuePair(QString line) {
    if(line.isEmpty())
        return false;
    else if(!line.contains("="))
        return false;
    else if(line.startsWith("="))
        return false;
    return true;
}

bool LinboConfigReader::_isLineBlockName(QString line) {
    return line.startsWith("[");
}

LinboConfigReader::KeyValuePair LinboConfigReader::_parseLineAsKeyValuePair(Line line) {
    const QString content = line.content;
    const QString key = content.section('=', 0, 0).simplified().toLower();
    const QString value = content.section('=', 1).simplified();
    return KeyValuePair {key, value};
}

QString LinboConfigReader::_parseLineAsBlockName(LinboConfigReader::Line line) {
    QString blockName = line.content;
    blockName = blockName.replace("[", "").replace("]", "");
    return blockName.simplified().toLower();
}

QString LinboConfigReader::_sanitizeLine(QString line) {
    line = line.split("#")[0];
    return line.simplified();
}

void LinboConfigReader::_loadEnvironmentValues(LinboConfig* config) {
    this->_backend->logger()->_log("Loading environment values", LinboLogger::LinboGuiInfo);

    config->_ipAddress = this->_backend->loadEnvironmentValue("ip");
    config->_subnetMask = this->_backend->loadEnvironmentValue("netmask");
    config->_subnetBitmask = this->_backend->loadEnvironmentValue("bitmask");
    config->_macAddress = this->_backend->loadEnvironmentValue("mac");
    config->_linboVersion = this->_backend->loadEnvironmentValue("version");
    config->_hostname = this->_backend->loadEnvironmentValue("hostname");
    config->_cpuModel = this->_backend->loadEnvironmentValue("cpu");
    config->_ramSize = this->_backend->loadEnvironmentValue("memory");
    config->_cacheSize = this->_backend->getPartitionSize(config->cachePath());

    // Harddisk Size
    QRegularExpression removePartition("[0-9]{1,2}");
    // e.g. turn /dev/sda1 into /dev/sda
    config->_hddSize = this->_backend->getPartitionSize(config->cachePath().replace(removePartition, ""));

    this->_loadExistingImages(config);
    this->_backend->logger()->_log("Finished loading environment values", LinboLogger::LinboGuiInfo);
}

void LinboConfigReader::_loadExistingImages(LinboConfig* config) {
    QStringList existingImageNames = this->_backend->_linboCmd->getOutput("listimages", config->cachePath()).split("\n");
    for(const QString &existingImageName : existingImageNames) {
        if(existingImageName.isEmpty())
            continue;

        LinboImage* existingImage = nullptr;
        if(!config->_images.contains(existingImageName)) {
            existingImage = new LinboImage(existingImageName, this->_backend);
            config->_images.insert(existingImageName, existingImage);
        }
        else {
            existingImage = config->_images[existingImageName];
        }

        if(existingImage != nullptr)
            existingImage->_existsOnDisk = true;
    }
}

bool LinboConfigReader::_loadThemeConfig(QString themeConfFilePath, LinboConfig* config) {
    QSettings settingsReader(themeConfFilePath, QSettings::IniFormat);
    LinboTheme* themeConfig = new LinboTheme();
    if(settingsReader.status() != QSettings::NoError) {
        this->_backend->logger()->error("Could not read theme config: " + themeConfFilePath);
        config->_theme = themeConfig;
        return false;
    }

    QMapIterator<LinboTheme::LinboThemeColorRole, QString> ic(themeConfig->colorRolesAndNames());
    while (ic.hasNext()) {
        ic.next();
        //qDebug() << qPrintable("    - `" + ic.value().toLower().replace("color", "") + "`");
        QColor colorFromConf = settingsReader.value("colors/" + ic.value().toLower().replace("color", ""), "").toString();
        if(colorFromConf.isValid()) {
            themeConfig->_colors[ic.key()] = colorFromConf;
        }
    }

    QMapIterator<LinboTheme::LinboThemeIcon, QString> ii(themeConfig->iconsAndNames());
    while (ii.hasNext()) {
        ii.next();
        QString iconConfKey = "icons/" + ii.value().toLower().replace("icon", "");
        //qDebug() << qPrintable("    - `" + ii.value().toLower().replace("icon", "") + "`");
        QString iconFromConf = settingsReader.value(iconConfKey, "").toString();
        if(!iconFromConf.isEmpty()) {
            themeConfig->_icons[ii.key()] = this->_iconBasePath + "/" + iconFromConf;
        }
    }

    if(!config->backgroundColor().isEmpty())
        themeConfig->_colors[LinboTheme::PrimaryColor] = config->backgroundColor();

    config->_theme = themeConfig;
    return true;
}

void LinboConfigReader::_loadConfigFromBlock(Block block, LinboConfig *config) {
    if(block.name == "linbo") {
        this->_loadLinboConfigFromBlock(block.config, config);
    }
    else if(block.name == "partition") {
        this->_loadPartitionConfigFromBlock(block.config, config);
    }
    else if(block.name == "os") {
        this->_loadOsConfigFromBlock(block.config, config);
    }
    else if(!block.name.isEmpty()) {
        this->_backend->logger()->error("Got invalid config block: " + block.name);
    }
}

void LinboConfigReader::_loadLinboConfigFromBlock(QMap<QString, QString> rawLinboConfig, LinboConfig* linboConfig) {
    for(auto iterator = rawLinboConfig.begin(); iterator != rawLinboConfig.end(); iterator++) {
        QString key = iterator.key();
        QString value = iterator.value();
        if(key == "server")  linboConfig->_serverIpAddress = value;
        else if(key == "cache")   linboConfig->_cachePath = value;
        else if(key == "roottimeout")   linboConfig->_rootTimeout = (unsigned int)value.toInt();
        else if(key == "group")   linboConfig->_hostGroup = value;
        else if(key == "autopartition")  linboConfig->_autoPartition = _stringToBool(value);
        else if(key == "autoinitcache")  linboConfig->_autoInitCache = _stringToBool(value);
        else if(key == "autoformat")  linboConfig->_autoFormat = _stringToBool(value);
        else if(key == "backgroundcolor" && this->_validateColorCode(value)) linboConfig->_backgroundColor = "#" + value;
        else if(key == "downloadtype")  linboConfig->_downloadMethod = LinboConfig::stringToDownloadMethod(value);
        else if(key == "locale") linboConfig->_locale = value;
        else if(key == "guidisabled") linboConfig->_guiDisabled = this->_stringToBool(value);
        else if(key == "clientdetailsvisiblebydefault") linboConfig->_clientDetailsVisibleByDefault = this->_stringToBool(value);
        else if(key == "themeconffile") linboConfig->_themeConfFile = value;
    }
}

void LinboConfigReader::_loadPartitionConfigFromBlock(QMap<QString, QString> rawParitionConfig, LinboConfig* config) {
    LinboDiskPartition* partition = new LinboDiskPartition(this);

    for(auto iterator = rawParitionConfig.begin(); iterator != rawParitionConfig.end(); iterator++) {
        QString key = iterator.key();
        QString value = iterator.value();
        if(key == "dev") partition->_path = value;
        else if(key == "size")  partition->_size = value.toInt();
        else if(key == "id")  partition->_id = value;
        else if(key == "fstype")  partition->_fstype = value;
        else if(key.startsWith("bootable"))  partition->_bootable = _stringToBool(value);
    }

    if(partition->path() != "")
        config->_diskPartitions.append(partition);
    else
        partition->deleteLater();
}

void LinboConfigReader::_loadOsConfigFromBlock(QMap<QString, QString> rawOsConfig, LinboConfig* config) {
    LinboOs* os = new LinboOs(this->_backend);

    for(auto iterator = rawOsConfig.begin(); iterator != rawOsConfig.end(); iterator++) {
        QString key = iterator.key();
        QString value = iterator.value();
        if(key == "name")               os->_name = value;
        else if(key == "description")   os->_description = value;
        else if(key == "version")       os->_version = value;
        else if(key == "iconname")      os->_iconName = value;
        else if(key == "boot")          os->_bootPartition = value;
        else if(key == "root")          os->_rootPartition = value;
        else if(key == "kernel")        os->_kernel = value;
        else if(key == "initrd")        os->_initrd = value;
        else if(key == "append")        os->_kernelOptions = value;
        else if(key == "syncenabled")   os->_syncButtonEnabled = _stringToBool(value);
        else if(key == "startenabled")  os->_startButtonEnabled = _stringToBool(value);
        else if((key == "remotesyncenabled") || (key == "newenabled"))   os->_reinstallButtonEnabled = _stringToBool(value);
        else if(key == "defaultaction") os->_defaultAction = os->startActionFromString(value);
        else if(key == "autostart")     os->_autostartEnabled = _stringToBool(value);
        else if(key == "autostarttimeout")   os->_autostartTimeout = value.toInt();
        else if(key == "hidden")        os->_hidden = _stringToBool(value);
        else if(key == "baseimage") {
            if(!config->_images.contains(value))
                config->_images.insert(value, new LinboImage(value, this->_backend));
            os->_setBaseImage(config->_images[value]);
        }
    }

    if(os->name() != "")
        config->_operatingSystems.append(os);
    else
        os->deleteLater();

}

bool LinboConfigReader::_validateColorCode(QString code) {
    QRegularExpression regex("^([a-fA-F0-9]{6})$");
    return regex.match(code).hasMatch();
}

bool LinboConfigReader::_stringToBool(const QString& value) {
    return this->_trueWords.contains(value.simplified().toLower());
}
