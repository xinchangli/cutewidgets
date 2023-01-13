#include "testedit.h"

#include <QLabel>
#include <QLineEdit>
#include <QVBoxLayout>

class TestEditPrivate
{
    Q_DECLARE_PUBLIC(TestEdit)
    TestEdit *q_ptr;

public:
    QLabel *name;
    QLineEdit *input;

    TestEditPrivate(TestEdit *q);
};

TestEdit::TestEdit(QWidget *parent)
    : QWidget{parent}, d_ptr(new TestEditPrivate(this))
{
    Q_D(TestEdit);

    auto vLayout = new QVBoxLayout;
    setLayout(vLayout);

    d->name = new QLabel;
    resetName();
    d->input = new QLineEdit;
    d->input->setPlaceholderText("please input");
    resetValue();
    vLayout->addWidget(d->name);
    vLayout->addWidget(d->input);
}

QString TestEdit::getName()
{
    Q_D(TestEdit);
    return d->name->text();
}

void TestEdit::setName(const QString &text)
{
    Q_D(TestEdit);
    if(d->name->text() == text)
        return;

    d->name->setText(text);
    Q_EMIT nameChanged(text);
}

void TestEdit::resetName()
{
    Q_D(TestEdit);
    d->name->setText("untitled");
}

QString TestEdit::getValue()
{
    Q_D(TestEdit);
    return d->input->text();
}

void TestEdit::setValue(const QString &text)
{
    Q_D(TestEdit);
    if(d->input->text() == text)
        return;

    d->input->setText(text);
    Q_EMIT valueChanged(text);
}

void TestEdit::resetValue()
{
    Q_D(TestEdit);
    d->input->setText("");
}

TestEditPrivate::TestEditPrivate(TestEdit *q) : q_ptr(q)
{

}
