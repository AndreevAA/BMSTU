#pragma once

#include <QObject>
#include <QVector>

#include <config.h>

class HallPanel : public QObject {
  Q_OBJECT
  enum panel_status { FREE, BUSY };

public:
  explicit HallPanel(QObject *parent = nullptr);
  void set_new_target(int floor);
  void set_temp_direction();

signals:
  void set_target(int floor, direction dir);

public slots:
  void achieved_floor(int floor);
  void passed_floor(int floor);

private:
  int temp_floor_number;
  int temp_target = -1;

  QVector<bool> is_target;
  panel_status temp_status;
  direction temp_direction;
  bool next_target(int &floor);
  void find_new_target();
};
