#pragma once

#include <QMainWindow>
#include <lift.h>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow {
  Q_OBJECT

public:
  explicit MainWindow(QWidget *parent = nullptr);
  ~MainWindow() override;

  void on_button_cabin_clicked(int num);

private slots:
  void on_button_floor_clicked(int num);

private:
  Ui::MainWindow *ui;
  Lift lift;
};
