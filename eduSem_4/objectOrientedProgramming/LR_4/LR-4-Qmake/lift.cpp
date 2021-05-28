#include <lift.h>

Lift::Lift() 
{
	QObject::connect(&hall_panel, SIGNAL(set_target(int, direction)), &cabin, SLOT(cabin_call(int, direction)));
	QObject::connect(&cabin, SIGNAL(cabin_crossing_floor(int, direction)), &hall_panel, SLOT(passed_floor(int)));
	QObject::connect(&cabin, SIGNAL(cabin_stopped(int)), &hall_panel, SLOT(achieved_floor(int)));
}

void Lift::click(int floor) 
{ 
	hall_panel.set_new_target(floor); 
}
