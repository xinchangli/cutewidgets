#ifndef DESIGNER_PLUGIN_H
#define DESIGNER_PLUGIN_H

#include <QtGlobal>
#include <QtPlugin>

#if QT_VERSION >= 0x050600
#include <QtUiPlugin/QDesignerCustomWidgetInterface>
#else
#include <QDesignerCustomWidgetInterface>
#endif

#define STR(R) #R
#define STRVALUE(R) STR(R)

#ifdef CUTEWIDGETS_STR
const QString strQTInclude = QString("%1/").arg(STRVALUE(CUTEWIDGETS_STR));
#elif
const QString strQTInclude = "";
#endif

class CustomWidgetInterface : public QDesignerCustomWidgetInterface
{
public:
    virtual QString group() const override { return "Cute Widgets"; }
    virtual bool isContainer() const override { return false; }
    virtual bool isInitialized() const override { return true; }

    virtual QIcon icon() const override { return m_icon; }
    virtual QString codeTemplate() const override { return m_codeTemplate; }
    virtual QString domXml() const override { return m_domXml; }
    virtual QString includeFile() const override { return m_include; }
    virtual QString name() const override { return m_name; }
    virtual QString toolTip() const override { return m_toolTip; }
    virtual QString whatsThis() const override { return m_whatsThis; }

protected:
    QString m_name;
    QString m_include;
    QString m_toolTip;
    QString m_whatsThis;
    QString m_domXml;
    QString m_codeTemplate;
    QIcon m_icon;
};

#ifdef DEFINE_CUTEWIDGETS_TESTEDIT

class TestEditInterface : public CustomWidgetInterface
{
public:
    TestEditInterface();

    virtual QWidget *createWidget(QWidget* parent) override;
};

#endif

/*******************************************************************************************************************/
/*                                          在此以上填写自定义接口类                                                    */
/*******************************************************************************************************************/

class CuteWidgetsCollectionInterface
    : public QObject
    , public QDesignerCustomWidgetCollectionInterface
{
    Q_OBJECT
    Q_INTERFACES(QDesignerCustomWidgetCollectionInterface)

#if QT_VERSION >= 0x050000
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QDesignerCustomWidgetCollectionInterface" )
#endif

public:
    CuteWidgetsCollectionInterface() : QObject()
    {
#ifdef DEFINE_CUTEWIDGETS_TESTEDIT
        m_plugins += new TestEditInterface();
#endif

    }

    virtual ~CuteWidgetsCollectionInterface() override
    {
        qDeleteAll(m_plugins);
    }

    QList<QDesignerCustomWidgetInterface*> customWidgets() const override
    {
        return m_plugins;
    }

private:
    QList<QDesignerCustomWidgetInterface*> m_plugins;
};

#endif // DESIGNER_PLUGIN_H
