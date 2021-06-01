#ifndef DOOR_H

#include <door.h>

#include <QDebug>

Doors::Doors(QObject *parent) : QObject(parent), temp_status(CLOSED) 
{
  doors_stay_open_timer.setInterval(WAITING_CABIN_TIME);
  doors_stay_open_timer.setSingleShot(true);

  doors_open_timer.setSingleShot(true);
  doors_close_timer.setSingleShot(true);

  QObject::connect(&doors_open_timer, SIGNAL(timeout()), this, SLOT(open()));
  QObject::connect(&doors_close_timer, SIGNAL(timeout()), this, SLOT(close()));
  QObject::connect(this, SIGNAL(opened_doors()), &doors_stay_open_timer, SLOT(start()));
  QObject::connect(&doors_stay_open_timer, SIGNAL(timeout()), this, SLOT(start_closing()));
}

void Doors::start_openning() 
{
  if (temp_status == CLOSED) 
  {
    temp_status = OPENNING;

    qDebug() << "Двери лифта открываются...";
    doors_open_timer.start(OPENING_DOORS_TIME);
  } 
  else if (temp_status == CLOSING)
  {
    temp_status = OPENNING;

    qDebug() << "Двери лифта открываются...";
    int t = doors_close_timer.remainingTime();
    doors_close_timer.stop();
    doors_open_timer.start(OPENING_DOORS_TIME - t);
  }
}

void Doors::start_closing() 
{
  if (temp_status == CLOSED)
    emit closed_doors();
  else if (temp_status == OPENED)
  {
    temp_status = CLOSING;
    qDebug() << "Две лифта закрываются...";
    doors_close_timer.start(OPENING_DOORS_TIME);
  }
}

void Doors::open() 
{
  if (temp_status == OPENNING)
  {
    temp_status = OPENED;
    qDebug() << "Двери лифта открыты!\nОбмен пассажирами...";
    emit opened_doors();
  }
}

void Doors::close() 
{
  if (temp_status == CLOSING)
  {
    temp_status = CLOSED;
    qDebug() << "Двери лифта закрылись!";
    emit closed_doors();
  }
}

#endif

