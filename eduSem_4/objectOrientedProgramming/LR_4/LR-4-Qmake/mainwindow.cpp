#include <QDebug>
#include <mainwindow.h>
#include <interface.h>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent), ui(new Ui::MainWindow) 
    {
  ui->setupUi(this);

  qDebug() << "Лифт стоит на 1-и этаже, двери закрыты.\n"
              "Ожидание вызова...";

  for (unsigned long long i = 0; i < ui->cabin_buttons.size(); ++i) 
    connect(ui->cabin_buttons[i], &QPushButton::pressed, this,
            [=, this]() {on_button_cabin_clicked(i + 1); });

  for (unsigned long long i = 0; i < ui->cabin_buttons.size(); ++i)
    connect(ui->floor_buttons[i], &QPushButton::pressed, this,
            [=, this]() {on_button_floor_clicked(i + 1); });
}

MainWindow::~MainWindow() { delete ui; }

void MainWindow::on_button_cabin_clicked(int num) 
{
  qDebug() << "В лижте нажали кнопку этажа " << num;
  lift.click(num);
}

void MainWindow::on_button_floor_clicked(int num) 
{
  qDebug() << "Этаж " << num << " вызван.";
  lift.click(num);
}
