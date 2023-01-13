#include "designer_plugin.h"

#ifdef DEFINE_CUTEWIDGETS_TESTEDIT
#include "testedit.h"
#include <QMessageBox>
#endif

#ifdef DEFINE_CUTEWIDGETS_TESTEDIT

TestEditInterface::TestEditInterface()
{
    m_name = "TestEdit";
    m_include = strQTInclude + "testedit.h";
    m_icon = QPixmap(":/resource/testedit.png");
    m_domXml =
        "<widget class=\"TestEdit\" name=\"testEdit\">\n"
        " <property name=\"geometry\">\n"
        "  <rect>\n"
        "   <x>0</x>\n"
        "   <y>0</y>\n"
        "   <width>200</width>\n"
        "   <height>60</height>\n"
        "  </rect>\n"
        " </property>\n"
        "</widget>\n";
}

QWidget *TestEditInterface::createWidget(QWidget *parent)
{
    auto w = new TestEdit(parent);
    QObject::connect(w, &TestEdit::nameChanged, [](QString name){
        QMessageBox::information(nullptr, "info", QString("name changed : %1").arg(name));
    });

    QObject::connect(w, &TestEdit::valueChanged, [](QString value){
        QMessageBox::information(nullptr, "info", QString("value changed : %1").arg(value));
    });

    return w;
}

#endif

#if QT_VERSION < 0x050000
Q_EXPORT_PLUGIN2( QwtDesignerPlugin, WidgetCollectionInterface )
#endif


