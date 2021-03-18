#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QFileDialog>
#include <QMessageBox>

#include "controller.h"
#include "io.h"
#include "operations.h"
#include "object.h"

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_pushButton_choose_clicked();

    void on_lineEdit_file_textChanged(const QString &arg1);

    void on_pushButton_load_clicked();

    void draw();

    void on_pushButton_unload_clicked();

    void on_button_move_clicked();

    void on_button_scale_clicked();

    void update_obj_center_info();

    void on_button_rotate_clicked();

    void show_message(const int &err);

private:
    Ui::MainWindow *ui;
};
#endif // MAINWINDOW_H
