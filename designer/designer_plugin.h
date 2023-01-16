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

class CuteWidgetInterface : public QDesignerCustomWidgetInterface
{
public:
    virtual QString name() const override;
    virtual QString group() const override;
    virtual QString toolTip() const override;
    virtual QString whatsThis() const override;
    virtual QString includeFile() const override;
    virtual QIcon icon() const override;

    virtual bool isContainer() const override;

    virtual bool isInitialized() const override;
    virtual void initialize(QDesignerFormEditorInterface *core) override;

    virtual QString domXml() const override;

    virtual QString codeTemplate() const override;

protected:
    QString m_name;
    QString m_group;
    QString m_toolTip;
    QString m_whatsThis;
    QString m_include;
    QIcon m_icon;
    bool m_isContainer;
    bool m_initialized;
    QString m_domXml;
    QString m_codeTemplate;
};

#ifdef DEFINE_CUTEWIDGETS_TESTEDIT

class TestEditInterface : public CuteWidgetInterface
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
