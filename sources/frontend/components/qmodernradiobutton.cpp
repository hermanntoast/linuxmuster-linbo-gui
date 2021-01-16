#include "qmodernradiobutton.h"

QModernRadioButton::QModernRadioButton(QString label, bool darkMode, QWidget* parent) : QRadioButton(label, parent)
{

}

void QModernRadioButton::paintEvent(QPaintEvent *e) {
    QString indicatorSize = QString::number(this->font().pixelSize() * 0.8);
    this->setStyleSheet("QRadioButton::indicator {"
                        "width: " + indicatorSize + "px;"
                        "height: " + indicatorSize + "px;"
                        "}"
                        "QRadioButton::indicator:unchecked {"
                        "image: url(:/icons/universal/components/radioButtonUnchecked.svg);"
                        "}"
                        "QRadioButton::indicator:checked {"
                        "image: url(:/icons/universal/components/radioButtonChecked.svg);"
                        "}"
                        "");

    QRadioButton::paintEvent(e);
}
