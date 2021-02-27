#include "../inc/config.h"
#include "../inc/polynom_newton.h"

double get_numerator(point_t **points, int temp_polynom_level)
{
	double temp_function_value = 0;

	for (int first_geratation_deepacity = 0; first_geratation_deepacity <= temp_polynom_level; first_geratation_deepacity++)
	{
        double den = 1;
        for(int second_geratation_deepacity = 0; second_geratation_deepacity <= temp_polynom_level; second_geratation_deepacity++)
            if (second_geratation_deepacity != first_geratation_deepacity) 
                den *= ((*points)[first_geratation_deepacity].x - (*points)[second_geratation_deepacity].x);
        temp_function_value += (*points)[first_geratation_deepacity].y / den;
    }

    return temp_function_value;
}

double get_function_value_with_polynom_level_newton(int polynom_level, point_t **points, int number_of_points)
{
	double result_summary = (*points)[0].y;
    
    for (int temp_polynom_level = 1; temp_polynom_level < polynom_level; temp_polynom_level++)
    {
        double temp_function_value = get_numerator(points, temp_polynom_level);
        
        for(int temp_generation_of_multiplication = 0; temp_generation_of_multiplication < temp_polynom_level; temp_generation_of_multiplication++)
            temp_function_value *= (x_middle - (*points)[temp_generation_of_multiplication].x);

        result_summary += temp_function_value;
    }

    return result_summary;
}
