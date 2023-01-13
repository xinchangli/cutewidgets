#include "mainwindow.h"
#include "ui_mainwindow.h"

#include "testedit/testedit.h"

#include <QVBoxLayout>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    auto v = new QVBoxLayout;
    v->addWidget(new TestEdit(this));
    ui->centralwidget->setLayout(v);
}

MainWindow::~MainWindow()
{
    delete ui;
}

