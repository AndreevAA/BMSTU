#ifndef LIFT_H
#pragma once

#include <QObject>
#include <QTextEdit>

#include <cabin.h>
#include <config.h>
#include <hall_panel.h>

class Lift : public QObject {
  Q_OBJECT

public:
  Lift();
  void click(int floor);

private:
  HallPanel hall_panel;
  Cabin cabin;
};

#endif
