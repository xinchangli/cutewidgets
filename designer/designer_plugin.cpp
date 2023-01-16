#include "designer_plugin.h"

#ifdef DEFINE_CUTEWIDGETS_TESTEDIT
#include "testedit.h"
#include <QMessageBox>
#endif

QString CuteWidgetInterface::name() const
{
    return m_name;
}

QString CuteWidgetInterface::group() const
{
    return m_group;
}

QString CuteWidgetInterface::toolTip() const
{
    return m_toolTip;
}

QString CuteWidgetInterface::whatsThis() const
{
    return m_whatsThis;
}

QString CuteWidgetInterface::includeFile() const
{
    return m_include;
}

QIcon CuteWidgetInterface::icon() const
{
    return m_icon;
}

bool CuteWidgetInterface::isContainer() const
{
    return m_isContainer;
}

bool CuteWidgetInterface::isInitialized() const
{
    return m_initialized;
}

void CuteWidgetInterface::initialize(QDesignerFormEditorInterface *core)
{
    if (m_initialized)
        return;

    // Add extension registrations, etc. here

    m_initialized = true;
}

QString CuteWidgetInterface::domXml() const
{
    return m_domXml;
}

QString CuteWidgetInterface::codeTemplate() const
{
    return m_codeTemplate;
}

#ifdef DEFINE_CUTEWIDGETS_TESTEDIT

    TestEditInterface::TestEditInterface()
{
    m_name = "TestEdit";
    m_group = "Cute Widgets";
    m_toolTip = "TestEdit";
    m_whatsThis = "TestEdit";
    m_include = strQTInclude + "testedit.h";
    m_icon = QPixmap(":/resource/testedit.png");
    m_isContainer = false;
    m_domXml = QDesignerCustomWidgetInterface::domXml();
    m_codeTemplate = QDesignerCustomWidgetInterface::codeTemplate();
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
