#include <hall_panel.h>

#include <iostream>

#include <QDebug>

HallPanel::HallPanel(QObject *parent)
    : QObject(parent), temp_floor_number(1), temp_target(-1),
      is_target(NUM_FLOORS, false), temp_status(FREE), temp_direction(STAY) {}

void HallPanel::set_temp_direction()
{
  if (temp_floor_number > temp_target)
    temp_direction = DOWN;
  else
    temp_direction = UP;
}

void HallPanel::set_new_target(int floor) 
{
  temp_status = BUSY;
  is_target[floor - 1] = true;

  if (temp_target == -1)
    temp_target = floor;

  if ((temp_direction == UP && floor > temp_target) ||
      (temp_direction == DOWN && floor < temp_target))
    temp_target = floor;

  next_target(floor);

  set_temp_direction();

  emit set_target(floor, temp_direction);
}

void HallPanel::achieved_floor(int floor) 
{
  if (temp_status == BUSY)
  {
    temp_floor_number = floor;
    is_target[floor - 1] = false;

    if (temp_floor_number == temp_target) 
    {
      temp_target = -1;
      find_new_target();
    }

    if (next_target(floor)) 
    {
      temp_direction = (temp_floor_number > temp_target) ? DOWN : UP;
      emit set_target(floor, temp_direction);
    } 
    else 
      temp_status = FREE;
  }
}

void HallPanel::passed_floor(int floor) 
{
  temp_floor_number = floor;
  qDebug() << "Перемещение... текущий этаж:" << floor;
}

void HallPanel::find_new_target() 
{
  int state = false;

  if (temp_direction == UP) 
    for (int temp_check_floor = NUM_FLOORS; temp_check_floor >= 1 && !state; temp_check_floor--) 
      if (is_target[temp_check_floor - 1]) 
      {
        state = true;
        temp_target = temp_check_floor;
      }
  else
    for (int temp_check_floor = 1; temp_check_floor <= NUM_FLOORS && !state; temp_check_floor++) 
      if (is_target[temp_check_floor - 1]) 
      {
        state = true;
        temp_target = temp_check_floor;
      }
}

bool HallPanel::next_target(int &floor) 
{
  bool res_is_target = false;

  if (temp_target > temp_floor_number) 
  {
    bool is_in = true;
    for (int temp_check_floor = temp_floor_number; temp_check_floor <= NUM_FLOORS && is_in; temp_check_floor += 1) 
      if (is_target[temp_check_floor - 1]) 
      {
        floor = temp_check_floor;

        res_is_target = true;
        is_in = false;
      }
  } 
  else 
  {
    bool is_in = true;
    for (int temp_check_floor = temp_floor_number; temp_check_floor >= 1 && is_in; temp_check_floor -= 1) 
      if (is_target[temp_check_floor - 1]) 
      {
        floor = temp_check_floor;

        res_is_target = true;
        is_in = false;
      }
  }

  return res_is_target;
}
