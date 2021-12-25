/****************************************************************************
 ** Modern Linbo GUI
 ** Copyright (C) 2020-2021  Dorian Zedler <dorian@itsblue.de>
 **
 ** This program is free software: you can redistribute it and/or modify
 ** it under the terms of the GNU Affero General Public License as published
 ** by the Free Software Foundation, either version 3 of the License, or
 ** (at your option) any later version.
 **
 ** This program is distributed in the hope that it will be useful,
 ** but WITHOUT ANY WARRANTY; without even the implied warranty of
 ** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 ** GNU Affero General Public License for more details.
 **
 ** You should have received a copy of the GNU Affero General Public License
 ** along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ****************************************************************************/

#include "linboosselectbutton.h"

LinboOsSelectButton::LinboOsSelectButton(QString icon, LinboOs* os, QButtonGroup* buttonGroup, QWidget* parent) : QWidget(parent)
{
    this->_showActionButtons = false;
    this->_inited = false;
    this->_buttonGroup = buttonGroup;
    this->_os = os;
    this->_shouldBeVisible = true;
    this->_showDefaultAction = true;
    this->_osNameLabel = nullptr;

    if(!QFile::exists(icon) || !icon.endsWith(".svg")) {
        icon = gTheme->getIconPath(LinboTheme::DefaultOsIcon);
    }

    connect(os->backend(), &LinboBackend::stateChanged, this, &LinboOsSelectButton::_handleBackendStateChange);

    QMap<LinboOs::LinboOsStartAction, QString> defaultStartActionOverlayPaths = {
        {LinboOs::StartOs, gTheme->getIconPath(LinboTheme::OverlayStartIcon)},
        {LinboOs::SyncOs, gTheme->getIconPath(LinboTheme::OverlaySyncIcon)},
        {LinboOs::ReinstallOs, gTheme->getIconPath(LinboTheme::OverlayReinstallIcon)},
        {LinboOs::UnknownAction, ""}
    };

    LinboPushButtonOverlay* checkedOverlay= new LinboPushButtonOverlay (
        LinboPushButtonOverlay::OnChecked,
        new QSvgWidget(gTheme->getIconPath(LinboTheme::OverlayCheckedIcon)),
        false
    );

    QString defaultActionOverlayPath = defaultStartActionOverlayPaths[this->_os->defaultAction()];
    if(!this->_os->actionEnabled(this->_os->defaultAction()))
        defaultActionOverlayPath = "";

    this->_defaultStartActionOverlay = new LinboPushButtonOverlay (
        LinboPushButtonOverlay::Background,
        new QSvgWidget(defaultActionOverlayPath),
        false
    );

    this->_defaultRootActionOverlay = new LinboPushButtonOverlay (
        LinboPushButtonOverlay::Background,
        new QSvgWidget(gTheme->getIconPath(LinboTheme::OverlayImageIcon)),
        false
    );

    this->_button = new LinboPushButton(icon, "", {checkedOverlay, this->_defaultStartActionOverlay, this->_defaultRootActionOverlay}, this);
    this->setToolTip(this->_os->description());

    if(!os->backend()->config()->useMinimalLayout()) {
        connect(this->_button, &LinboPushButton::clicked, this, &LinboOsSelectButton::_handlePrimaryButtonClicked);

        QMap<LinboOs::LinboOsStartAction, QString> startActionButtonIcons = {
            //% "Start %1"
            {LinboOs::StartOs, gTheme->getIconPath(LinboTheme::StartLegacyIcon)},
            //% "Sync and start %1"
            {LinboOs::SyncOs, gTheme->getIconPath(LinboTheme::SyncLegacyIcon)},
            //% "Reinstall %1"
            {LinboOs::ReinstallOs, gTheme->getIconPath(LinboTheme::ReinstallLegacyIcon)}
        };

        for(auto i = startActionButtonIcons.begin(); i != startActionButtonIcons.end(); i++) {
            LinboOs::LinboOsStartAction startAction = i.key();
            QString startActionIconPath = i.value();
            bool disabled = !this->_os->actionEnabled(startAction) || this->_os->defaultAction() == startAction;

            if(disabled)
                continue;

            LinboPushButton* actionButton = new LinboPushButton(startActionIconPath, this);
            actionButton->setToolTip(this->_getTooltipContentForAction(startAction));

            actionButton->setEnabled(!disabled);
            actionButton->setVisible(false);
            this->_startActionButtons.append(actionButton);

            switch (startAction) {
            case LinboOs::StartOs:
                connect(actionButton, &LinboPushButton::clicked, this->_os, &LinboOs::start);
                break;
            case LinboOs::SyncOs:
                connect(actionButton, &LinboPushButton::clicked, this->_os, &LinboOs::sync);
                break;
            case LinboOs::ReinstallOs:
                connect(actionButton, &LinboPushButton::clicked, this->_os, &LinboOs::reinstall);
                break;
            default:
                break;
            }
        }

        // root action button
        LinboPushButton* actionButton = new LinboPushButton(gTheme->getIconPath(LinboTheme::UploadLegacyIcon), this);
        actionButton->setGeometry(0,0,0,0);
        actionButton->setVisible(false);
        //% "Upload image of %1"
        actionButton->setToolTip(qtTrId("uploadImageOfOS").arg(this->_os->name()));
        connect(actionButton, &LinboPushButton::clicked, this, [=] {
            this->_os->backend()->setCurrentOs(this->_os);
            emit this->imageUploadRequested();
        });
        this->_rootActionButtons.append(actionButton);

        // OS name label
        this->_osNameLabel = new QLabel(this);
        if(this->_os->baseImage() != nullptr) {
            this->_osNameLabel->setText(this->_os->name());
            this->_osNameLabel->setStyleSheet("QLabel {color: " + gTheme->getColor(LinboTheme::TextColor).name() + "}");
        }
        else {
            //% "No baseimage defined"
            this->_osNameLabel->setText(qtTrId("main_noBaseImage"));
            this->_osNameLabel->setStyleSheet("QLabel {color: red}");
        }

        this->_osNameLabel->setWordWrap(true);
        this->_osNameLabel->setAlignment(Qt::AlignVCenter | Qt::AlignLeft);
    }
    else {
        connect(this->_button, &LinboPushButton::hovered, this, [=] {this->_button->setChecked(true);});
        connect(this->_button, &LinboPushButton::doubleClicked, this, &LinboOsSelectButton::_handlePrimaryButtonClicked);
    }

    this->_button->setCheckable(true);
    this->_buttonGroup->addButton(this->_button);
    this->_handleBackendStateChange(this->_os->backend()->state());

    QWidget::setVisible(true);
}

void LinboOsSelectButton::_handlePrimaryButtonClicked() {
    if(this->_os->backend()->state() == LinboBackend::Idle)
        switch (this->_os->defaultAction()) {
        case LinboOs::StartOs:
            this->_os->start();
            break;
        case LinboOs::SyncOs:
            this->_os->sync();
            break;
        case LinboOs::ReinstallOs:
            this->_os->reinstall();
            break;
        default:
            break;
        }
    else if (this->_os->backend()->state() == LinboBackend::Root) {
        this->_os->backend()->setCurrentOs(this->_os);
        emit this->imageCreationRequested();
    }
}

LinboOs* LinboOsSelectButton::_getOs() {
    return this->_os;
}

void LinboOsSelectButton::_setVisibleAnimated(bool visible) {
    this->_shouldBeVisible = visible;
    this->_button->setVisibleAnimated(visible);
    if(this->_osNameLabel != nullptr)
        this->_osNameLabel->setVisible(visible);

    this->_updateActionButtonVisibility();
}

void LinboOsSelectButton::setVisible(bool visible) {
    this->_shouldBeVisible = visible;
    this->_button->setVisible(visible);
    if(this->_osNameLabel != nullptr)
        this->_osNameLabel->setVisible(visible);

    this->_updateActionButtonVisibility(true);
}

void LinboOsSelectButton::resizeEvent(QResizeEvent *event) {
    QWidget::resizeEvent(event);

    if(!this->_showActionButtons || this->_os->backend()->config()->useMinimalLayout()) {
        this->_button->setGeometry((this->width() - this->height()) / 2, 0, this->height(), this->height());
    }
    else {
        this->_button->setGeometry(0, 0, event->size().height(), event->size().height());

        int x = this->height();
        int spacing = this->width() * 0.04;
        int actionButtonSize = (this->width() - this->height()) / 4 - spacing;

        if(this->height() <= 0 || this->width() / this->height() < 1.1) {
            // only the big button is visible
            actionButtonSize = 0;
            x = 0;
            spacing = 0;
        }

        for(LinboPushButton* actionButton : this->_startActionButtons) {
            actionButton->setGeometry(x + spacing, this->height() - actionButtonSize, actionButtonSize, actionButtonSize);
            x += actionButtonSize + spacing;
        }

        x = this->height();

        for(LinboPushButton* actionButton : this->_rootActionButtons) {
            actionButton->setGeometry(x + spacing, this->height() - actionButtonSize, actionButtonSize, actionButtonSize);
            x += actionButtonSize + spacing;
        }

        this->_osNameLabel->setGeometry(this->height() + spacing, 0, this->width() - this->height() - spacing * 2, actionButtonSize);
        QFont fontCache = this->_osNameLabel->font();
        fontCache.setPixelSize(gTheme->toFontSize(actionButtonSize * 0.5));
        this->_osNameLabel->setFont(fontCache);
    }

    this->_updateActionButtonVisibility();
}


void LinboOsSelectButton::_setShowActionButtons(bool showActionButtons) {
    if(this->_showActionButtons == showActionButtons && this->_inited)
        return;

    this->_showActionButtons = showActionButtons;
    this->_button->setCheckable(!showActionButtons);

    this->_updateActionButtonVisibility();
}

void LinboOsSelectButton::_handleBackendStateChange(LinboBackend::LinboState state) {
    this->_showDefaultAction = false;

    bool checkedOverlayMuted = true;

    switch (state) {
    case LinboBackend::Idle:
        this->_button->setToolTip(this->_getTooltipContentForAction(this->_os->defaultAction()));

        if(!this->_os->backend()->config()->useMinimalLayout())
            this->_showDefaultAction = true;

        checkedOverlayMuted = false;
        break;
    case LinboBackend::Root:
        //% "Create image of %1"
        this->_button->setToolTip(qtTrId("createImageOfOS").arg(this->_os->name()));

        if(!this->_os->backend()->config()->useMinimalLayout())
            this->_showDefaultAction = true;

        checkedOverlayMuted = false;
        break;
    case LinboBackend::Autostarting:
        this->_showDefaultAction = true;
        break;
    default:
        break;
    }

    this->_button->setOverlayTypeMuted(LinboPushButtonOverlay::OnChecked, checkedOverlayMuted);
    this->_updateActionButtonVisibility();
}

QString LinboOsSelectButton::_getTooltipContentForAction(LinboOs::LinboOsStartAction action) {
    QMap<LinboOs::LinboOsStartAction, QString> startActionButtonIcons = {
        //% "Start %1"
        {LinboOs::StartOs, qtTrId("startOS")},
        //% "Sync and start %1"
        {LinboOs::SyncOs, qtTrId("syncOS")},
        //% "Reinstall %1"
        {LinboOs::ReinstallOs, qtTrId("reinstallOS")}
    };

    return startActionButtonIcons[action].arg(this->_os->name());
}

void LinboOsSelectButton::_updateActionButtonVisibility(bool doNotAnimate) {

    bool startActionVisible = this->_shouldBeVisible && this->_os->backend()->state() < LinboBackend::Root;
    bool rootActionVisible = this->_shouldBeVisible && this->_os->backend()->state() >= LinboBackend::Root;

    if(this->_inited && !doNotAnimate) {
        this->_defaultStartActionOverlay->setVisibleAnimated(startActionVisible && this->_showDefaultAction);
        this->_defaultRootActionOverlay->setVisibleAnimated(rootActionVisible && this->_showDefaultAction);
    }
    else {
        this->_defaultStartActionOverlay->setVisible(startActionVisible && this->_showDefaultAction);
        this->_defaultRootActionOverlay->setVisible(rootActionVisible && this->_showDefaultAction);
    }

    if(this->_os->backend()->config()->useMinimalLayout())
        return;

    if(!this->_showActionButtons) {
        for(LinboPushButton* actionButton : this->_startActionButtons)
            actionButton->setVisible(false);

        for(LinboPushButton* actionButton : this->_rootActionButtons)
            actionButton->setVisible(false);

        this->_defaultStartActionOverlay->setVisible(false);
        this->_defaultRootActionOverlay->setVisible(false);

        return;
    }

    for(LinboPushButton* actionButton : this->_startActionButtons)
        if(this->_inited && !doNotAnimate)
            actionButton->setVisibleAnimated(startActionVisible);
        else
            actionButton->setVisible(startActionVisible);

    for(LinboPushButton* actionButton : this->_rootActionButtons)
        if(this->_inited && !doNotAnimate)
            actionButton->setVisibleAnimated(rootActionVisible);
        else
            actionButton->setVisible(rootActionVisible);

    this->_inited = true;
}

