#ifndef TESTEDIT_H
#define TESTEDIT_H

#include "cutewidgets_global.h"

#include <QWidget>

class TestEditPrivate;

class CUTEWIDGETS_EXPORT TestEdit : public QWidget
{
    Q_OBJECT

    Q_PROPERTY(QString title READ getName WRITE setName RESET resetName NOTIFY nameChanged)
    Q_PROPERTY(QString value READ getValue WRITE setValue RESET resetValue NOTIFY valueChanged)

public:
    explicit TestEdit(QWidget *parent = nullptr);

    QString getName();
    void setName(const QString &text);
    void resetName();

    QString getValue();
    void setValue(const QString &text);
    void resetValue();

Q_SIGNALS:
    void nameChanged(QString);
    void valueChanged(QString);

private:
    Q_DECLARE_PRIVATE(TestEdit)
    TestEditPrivate *d_ptr;
};

#endif // TESTEDIT_H
