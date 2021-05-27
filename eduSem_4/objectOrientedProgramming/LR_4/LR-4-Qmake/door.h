#ifndef DOOR_H
#pragma once

#include <QObject>

#include <config.h>

class Doors : public QObject 
{
  Q_OBJECT

  enum doors_status 
  { 
    OPENNING, OPENED, 
    CLOSING, CLOSED 
  };

  public:
    explicit Doors(QObject *parent = nullptr);

  signals:
    void closed_doors();
    void opened_doors();

  public slots:
    void start_openning();
    void start_closing();

  private slots:
    void open();
    void close();

  private:
    doors_status temp_status;
    QTimer doors_open_timer;
    QTimer doors_close_timer;
    QTimer doors_stay_open_timer;
};

#endif