#include "comparators.h"

int comp_double (const void *i, const void *j)
{
	return ((sort_key*)i)->double_value < ((sort_key*)j)->double_value;
}

int average_score_per_session_cmp (const void *i, const void *j)
{
	double left, right;

	if (((students_accommodation_information*)i)->social_home.is_social_home == SUCCESS_STATUS)
		left = ((students_accommodation_information*)i)->social_home.student.average_score_per_session;
	else
		left = ((students_accommodation_information*)i)->private_home.student.average_score_per_session;

	if (((students_accommodation_information*)j)->social_home.is_social_home == SUCCESS_STATUS)
		right = ((students_accommodation_information*)j)->social_home.student.average_score_per_session;
	else 
		right = ((students_accommodation_information*)j)->private_home.student.average_score_per_session;

	return left < right;
}

int house_or_campus_number_cmp (const void *i, const void *j)
{
	double left, right;

	if (((students_accommodation_information*)i)->social_home.is_social_home == SUCCESS_STATUS)
		left = ((students_accommodation_information*)i)->social_home.address.house_number;
	else
		left = ((students_accommodation_information*)i)->private_home.address.house_number;

	if (((students_accommodation_information*)j)->social_home.is_social_home == SUCCESS_STATUS)
		right = ((students_accommodation_information*)j)->social_home.address.house_number;
	else 
		right = ((students_accommodation_information*)j)->private_home.address.house_number;

	return left < right;
}

int flat_or_room_number_cmp (const void *i, const void *j)
{
	double left, right;

	if (((students_accommodation_information*)i)->social_home.is_social_home == SUCCESS_STATUS)
		left = ((students_accommodation_information*)i)->social_home.address.room_number;
	else
		left = ((students_accommodation_information*)i)->private_home.address.flat_number;

	if (((students_accommodation_information*)j)->social_home.is_social_home == SUCCESS_STATUS)
		right = ((students_accommodation_information*)j)->social_home.address.room_number;
	else 
		right = ((students_accommodation_information*)j)->private_home.address.flat_number;

	return left < right;
}

int age_cmp (const void *i, const void *j)
{
	double left, right;

	if (((students_accommodation_information*)i)->social_home.is_social_home == SUCCESS_STATUS)
		left = ((students_accommodation_information*)i)->social_home.student.age;
	else
		left = ((students_accommodation_information*)i)->private_home.student.age;

	if (((students_accommodation_information*)j)->social_home.is_social_home == SUCCESS_STATUS)
		right = ((students_accommodation_information*)j)->social_home.student.age;
	else 
		right = ((students_accommodation_information*)j)->private_home.student.age;

	return left < right;
}
