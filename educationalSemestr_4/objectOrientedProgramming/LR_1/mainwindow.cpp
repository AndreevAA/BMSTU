#include "mainwindow.h"
#include "ui_mainwindow.h"

using namespace std;

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    request task;
    task.controller_status = INITIALIZING;
    controller(task);
}

MainWindow::~MainWindow()
{
    request task;
    task.controller_status = EXIT;
    controller(task);
    delete ui;
}

void MainWindow::update_obj_center_info()
{
    if (ui->graphicsView->scene())
    {
        ui->lineEdit_center_x->setText(QString::number(ui->graphicsView->scene()->itemsBoundingRect().center().x()));
        ui->lineEdit_center_y->setText(QString::number(-ui->graphicsView->scene()->itemsBoundingRect().center().y()));
    }
    ui->lineEdit_center_x->repaint();
    return;
}

void MainWindow::on_pushButton_choose_clicked()
{
    QString str = QFileDialog::getOpenFileName(0, "Выберите 3Д объект", "/home/flame/Documents/study/OOP-master/Lab_01/3D-Objects/", "*.txt");
    ui->lineEdit_file->setText(str);
    return;
}

void MainWindow::on_lineEdit_file_textChanged(const QString &arg1)
{
    if (arg1.length() != 0)
        ui->pushButton_load->setEnabled(1);
    else
        ui->pushButton_load->setEnabled(0);
    return;
}

void MainWindow::draw()
{
    request task_d;
    task_d.controller_status = DRAWING_PICTURE;

    task_d.QGV = ui->graphicsView;
    task_d.draw_h = ui->graphicsView->height();
    task_d.draw_w = ui->graphicsView->width();

    show_message(controller(task_d));
    ui->graphicsView->repaint();
    return;
}

void MainWindow::on_pushButton_load_clicked()
{
    request task;
    task.controller_status = UPLOADING_FILE;

    task.file_name = ui->lineEdit_file->text().toLocal8Bit().data();
    show_message(controller(task));
    draw();
    update_obj_center_info();
    return;
}

void MainWindow::on_pushButton_unload_clicked()
{
    ui->graphicsView->scene()->clear();
    ui->graphicsView->repaint();
    update_obj_center_info();
    return;
}

void MainWindow::on_button_move_clicked()
{
    request task;
    task.controller_status = MOVING_PICTURE;

    bool dx_SUCCES_STATUS = 1, dy_SUCCES_STATUS = 1, dz_SUCCES_STATUS = 1;

    float dx = ui->lineEdit_dx->text().toFloat(&dx_SUCCES_STATUS);
    float dy = ui->lineEdit_dy->text().toFloat(&dy_SUCCES_STATUS);
    float dz = ui->lineEdit_dz->text().toFloat(&dz_SUCCES_STATUS);

    if (!dx_SUCCES_STATUS || !dy_SUCCES_STATUS || !dz_SUCCES_STATUS)
    {
        show_message(ERROR_STATUS_FIELDS);
        return;
    }

    task.move_dx = dx;
    task.move_dy = dy;
    task.move_dz = dz;

    show_message(controller(task));
    draw();
    update_obj_center_info();
    return;
}

void MainWindow::on_button_scale_clicked()
{
    request task;
    task.controller_status = SCALING_PICTURE;

    bool kx_SUCCES_STATUS = 1, ky_SUCCES_STATUS = 1, kz_SUCCES_STATUS = 1, xm_SUCCES_STATUS = 1, ym_SUCCES_STATUS = 1, zm_SUCCES_STATUS = 1;

    float kx, ky, kz, xm, ym, zm;

    kx = ui->lineEdit_KX->text().toFloat(&kx_SUCCES_STATUS);
    ky = ui->lineEdit_KY->text().toFloat(&ky_SUCCES_STATUS);
    kz = ui->lineEdit_KZ->text().toFloat(&kz_SUCCES_STATUS);

    if (ui->checkBox_UseCenterScale->isChecked())
    {
        xm = ui->graphicsView->scene()->itemsBoundingRect().center().x();
        ym = ui->graphicsView->scene()->itemsBoundingRect().center().y();
        zm = 0;
    }
    else
    {
        xm = ui->lineEdit_XM->text().toFloat(&xm_SUCCES_STATUS);
        ym = ui->lineEdit_YM->text().toFloat(&ym_SUCCES_STATUS);
        zm = ui->lineEdit_ZM->text().toFloat(&zm_SUCCES_STATUS);
    }
    if (!kx_SUCCES_STATUS || !ky_SUCCES_STATUS || !kz_SUCCES_STATUS || !xm_SUCCES_STATUS || !ym_SUCCES_STATUS || ! zm_SUCCES_STATUS)
    {
        show_message(ERROR_STATUS_FIELDS);
        return;
    }

    task.scale_kx = kx;
    task.scale_ky = ky;
    task.scale_kz = kz;

    task.scale_xm = xm;
    task.scale_ym = ym;
    task.scale_zm = zm;


    show_message(controller(task));
    draw();
    update_obj_center_info();
    return;
}

void MainWindow::on_button_rotate_clicked()
{
    request task;
    task.controller_status = ROTATING_PICTURE;

    bool dgx_SUCCES_STATUS = 1, dgy_SUCCES_STATUS = 1, dgz_SUCCES_STATUS = 1, xc_SUCCES_STATUS = 1, yc_SUCCES_STATUS = 1, zc_SUCCES_STATUS = 1;

    int dgx, dgy, dgz;
    float xc, yc, zc;

    dgx = ui->lineEdit_dgX->text().toInt(&dgx_SUCCES_STATUS);
    dgy = ui->lineEdit_dgY->text().toInt(&dgy_SUCCES_STATUS);
    dgz = ui->lineEdit_dgZ->text().toInt(&dgz_SUCCES_STATUS);
    if (ui->checkBox_UseCenterRotation->isChecked())
    {
        xc = ui->graphicsView->scene()->itemsBoundingRect().center().x();
        yc = ui->graphicsView->scene()->itemsBoundingRect().center().y();
        zc = 0;
    }
    else
    {
        xc = ui->lineEdit_XC->text().toFloat(&xc_SUCCES_STATUS);
        yc = ui->lineEdit_YC->text().toFloat(&yc_SUCCES_STATUS);
        zc = ui->lineEdit_ZC->text().toFloat(&zc_SUCCES_STATUS);
    }
    if (!dgx_SUCCES_STATUS || !dgy_SUCCES_STATUS || !dgz_SUCCES_STATUS || !xc_SUCCES_STATUS || !yc_SUCCES_STATUS || ! zc_SUCCES_STATUS)
    {
        show_message(ERROR_STATUS_FIELDS);
        return;
    }

    task.rotate_dgx = dgx;
    task.rotate_dgy = dgy;
    task.rotate_dgz = dgz;

    task.rotate_xc = xc;
    task.rotate_yc = yc;
    task.rotate_zc = zc;

    show_message(controller(task));
    draw();
    update_obj_center_info();
    return;
}
void MainWindow::show_message(const int &err)
{
    if (err != SUCCES_STATUS) {
        QMessageBox msgBox;
        msgBox.setIcon(QMessageBox::Critical);

        switch(err)
        {
            case ERROR_STATUS_OPEN_FILE:
                msgBox.setText("Ошибка во время открытия файла.");
                break;
            case ERROR_STATUS_FILE_DATA:
                msgBox.setText("Файл содержит некорректные данные.");
                break;
            case ERROR_STATUS_MEMORY:
                msgBox.setText("Возникла ошибка при выделении памяти.");
                break;
            case ERROR_STATUS_POINTS:
                msgBox.setText("Кол-во точек должно быть натуральным числом.");
                break;
            case ERROR_STATUS_LINKS:
                msgBox.setText("Кол-во граней должно быть натуральным числом, либо нулём.");
                break;
            case ERROR_STATUS_FIELDS:
                msgBox.setText("Введённые переменные должны быть целого или вещественного типа.");
                break;
            case ERROR_STATUS_VECTORS:
                msgBox.setText("Массивы вершин и граней не были инициализированы.");
                break;
            case ERROR_STATUS_LINKS_POINTS:
                msgBox.setText("Файл заполнен неверно. Грани связывают отсутствующие вершины.");
                break;
            default:
                msgBox.setText("Неизвестная ошибка.");
                break;
        }
        
        msgBox.exec();
    }
}
