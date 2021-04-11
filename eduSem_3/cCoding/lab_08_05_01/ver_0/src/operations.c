#include "../inc/operations.h"
#include "../inc/io.h"

void update_matrix(struct matrix *i, int n_size)
{
	struct matrix temp;
	temp.indicators = (int **)malloc((n_size) * sizeof(int *));
	temp.elements = (int *)malloc((n_size * n_size) * sizeof(int));
	temp.width = n_size;
	temp.height = n_size;

	for (int add = 0; add < n_size * n_size; add++)
	{
		temp.elements[add] = 0;
		if (add % temp.width == 0)
			temp.indicators[add / n_size] = temp.elements + add;
	}

	// printf("-->Filled matrix:\n");
	// output_matrix(&temp);
	// printf("<--\n");

	for (int check_string_number = 0; check_string_number < i->height; check_string_number++)
		for (int check_row_number = 0; check_row_number < i->width; check_row_number++)
		{
			//printf("%d -> %d\n", *(i->indicators[check_string_number] + check_row_number), check_string_number * temp.width + check_row_number);
			temp.elements[check_string_number * temp.width + check_row_number] = *(i->indicators[check_string_number] + check_row_number);
		}

	// printf("-->Rewritten matrix:\n");
	// output_matrix(&temp);
	// printf("<--\n");

	for (int check_string_number = i->height; check_string_number < temp.height; check_string_number++)
	{
		for (int check_row_number = 0; check_row_number < i->width; check_row_number++)
		{
			temp.elements[check_string_number * temp.width + check_row_number] = get_mid_num(&temp, check_row_number, check_string_number);
		}
	}

	// printf("-->Written ROWS matrix:\n");
	// output_matrix(&temp);
	// printf("<--\n");

	for (int check_string_number = 0; check_string_number < temp.height; check_string_number++)
	{
		for (int check_row_number = i->width; check_row_number < temp.width; check_row_number++)
		{
			temp.elements[check_string_number * temp.width + check_row_number] = get_max_num(&temp, check_string_number);
		}
	}

	// printf("-->Updated matrix:\n");
	// output_matrix(&temp);
	// printf("<--\n");

	free(i->indicators);
	free(i->elements);

	i->indicators = (int **)malloc((n_size) * sizeof(int *));
	i->elements = (int *)malloc((n_size * n_size) * sizeof(int));
	i->width = n_size;
	i->height = n_size;

	for (int cur = 0; cur < n_size * n_size; cur++)
	{
		//printf("HERE0\n");
		*(i->elements + cur) = *(temp.elements + cur);
		//printf("HERE1, %d\n", cur);
		if (cur % n_size == 0)
			*(i->indicators + cur / n_size) = i->elements + cur;
		//printf("HERE2\n");
	}
	//printf("HRERE OK\n");
	//output_matrix(i);
}

//  double pow_f(double x, double n)
//  {
//     if (n==0)
//         return 1;
//     else if (n==1)
//         return x;
//     else if (n % 2 == 0 )
//         return pow_f( x * x, n / 2);
//     else
//         return pow_f( x * x, n / 2) * x;
//  }

// double power(double x, long n) {
//     if(n == 0) return 1;
//     if(n < 0) return power ( 1.0 / x, -n);
//     return x * power(x, n - 1);
//  }

int get_mid_num(struct matrix *i, int row, int max_string)
{
	double m_su = 1.0;
  int check_string_number = 0;
	for (; check_string_number < max_string; check_string_number++)
  {
    printf("\n*(i->indicators[check_string_number] + row) = %d\n", *(i->indicators[check_string_number] + row));
		m_su = *(i->indicators[check_string_number] + row) * m_su;
  }
	return (int)(pow(m_su, 1 / (double)check_string_number));
}

int get_max_num(struct matrix *i, int str)
{
	int answer = *(i->indicators[str] + 0);
	for (int check_row_number = 0; check_row_number < i->width; check_row_number++)
	{
		//printf("*(i->indicators[str] + check_row_number) = %d, answer = %d\n", *(i->indicators[str] + check_row_number), answer);
		if (answer < *(i->indicators[str] + check_row_number))
			answer = *(i->indicators[str] + check_row_number);
	}

	//printf("get_max_num() = %d\n", answer);

	return answer;
}

int delete_min_string_or_table(struct matrix *i)
{
	int first_width = i->width;
	while (is_square_matrix(&i->height, &i->width) == ERROR_STATUS)
	{
		//printf("is_square_matrix(&i->height, &i->width) = %d\n", is_square_matrix(&i->height, &i->width));
		//printf("(%d, %d)\n", i->height, i->width);
		if (is_vertical_matrix(&i->height, &i->width))
		{
			for (int check_string_number = get_minimal_element(i, SUCCESS_STATUS); check_string_number < i->height - 1; check_string_number++)
				i->indicators[check_string_number] = i->indicators[check_string_number + 1];
			i->height--;
			//return SUCCESS_STATUS;
		}
		else
		{
			int temp_check_row_number = get_minimal_element(i, ERROR_STATUS);
			//printf("temp_check_row_number = %d\n", temp_check_row_number);
			//printf("first_width = %d\n", first_width);
			for (int check_string_number = 0; check_string_number < i->height; check_string_number++)
			{
				for (int check_row_number = temp_check_row_number; check_row_number < first_width; check_row_number++)
				{
					if (check_string_number * first_width + check_row_number + 1 < first_width * i->height + 1)
					{
						// printf("{\n");
						// output_matrix(i);
						// printf("}\n");
						//printf("i->width * i->height = %d\n", first_width * i->height);
						//printf("check_string_number = %d, i->width = %d, check_row_number = %d, PREV_VAL = %d (%d) <- SEC_VAL = %d (%d) \n", check_string_number, first_width, check_row_number, i->elements[check_string_number * first_width + check_row_number], check_string_number * first_width + check_row_number, i->elements[check_string_number * first_width + check_row_number + 1], check_string_number * first_width + check_row_number + 1);
						(i->elements[check_string_number * first_width + check_row_number]) = (i->elements[check_string_number * first_width + check_row_number + 1]);
					}
					//*(i->indicators[check_string_number] + check_row_number) = *(i->indicators[check_string_number] + check_row_number + 1);
				}
			}
			i->width--;
			//int temp_check_row_number = get_minimal_element(i, ERROR_STATUS);
			// for (int check_string_number = 0; check_string_number < i->height; check_string_number++)
			// {
			// 	printf("i->indicators[check_string_number] = %d, i->width = %d\n", *(i->indicators[check_string_number]), i->width);
			// 	for (int check_row_number = 0; check_row_number < i->width - 1; check_row_number++)
			// 	{
			// 		printf("check_string_number = %d, i->width = %d, check_row_number = %d, VALUE = %d, SUM = %d <- RIGHT_POS = %d, VALUE = %d\n", check_string_number, i->width, check_row_number, i->elements[check_string_number * i->width + check_row_number], check_string_number * i->width + check_row_number, check_string_number * i->width + check_row_number + 1, i->elements[check_string_number * i->width + check_row_number + 1]);
			// 		i->elements[check_string_number * i->width + check_row_number] = i->elements[check_string_number * i->width + check_row_number + 1];
			// 	}
			// }
			// i->width--;
			//return SUCCESS_STATUS;
		}
		//printf("\nNEW_DEL\n");
		//output_matrix(i);
		//mprintf("\n\n");
	}
	//printf("is_square_matrix(&i->height, &i->width) = %d\n", is_square_matrix(&i->height, &i->width));
	//printf("(%d, %d)\n", i->height, i->width);
	return SUCCESS_STATUS;
}

int get_multiplicated_powed_matrix(struct matrix *ab, struct matrix *a, struct matrix *b, int *ro, int *gamma)
{
	if (pow_matrix(&a, *ro) == SUCCESS_STATUS && pow_matrix(&b, *gamma) == SUCCESS_STATUS)
	{
		// printf("Result of POW!!!{\n");
		// printf("--->\n");
		// //printf("operation / degree = %d / %d\n", operation + 1, degree - 1);
		// printf("After pow:\n\n");
		// printf("I:\n");
		// output_matrix(a);
		// printf("<---\n");

		// printf("--->\n");
		// //printf("operation / degree = %d / %d\n", operation + 1, degree - 1);
		// printf("After pow:\n\n");
		// printf("I:\n");
		// output_matrix(b);
		// printf("<---}\n");

		ab->height = a->height;
		ab->width = b->width;
		ab->indicators = (int **)malloc((ab->height) * sizeof(int *));
		ab->elements = (int *)malloc((ab->height * ab->width) * sizeof(int));
		if (mult_matrix(ab, a, b))
		{
			free_matrix(a);
			free_matrix(b);
			return SUCCESS_STATUS;
		}
	}
	return ERROR_STATUS;
}


int pow_matrix(struct matrix **i, int degree)
{
	//printf("POW{\n");
	int operation = 0;
  if (degree == 0)
  {
    for (int check_string_number = 0; check_string_number < (*i)->height; check_string_number++)
      {
        for (int check_row_number = 0; check_row_number < (*i)->width; check_row_number++)
        {
          //printf("check_string_number = %d, check_row_number = %d -> ", check_string_number, check_row_number);
          //printf("HERE1\n");
          if (check_row_number == check_string_number)
            *((*i)->elements + check_string_number * (*i)->width + check_row_number) = 1;
          else
            *((*i)->elements + check_string_number * (*i)->width + check_row_number) = 0;
          
          // printf("HERE2\n");
          // //printf("Added: %d\n", *(second_matrix.indicators[check_string_number] + check_row_number));
          // //*(second_matrix.elements + check_string_number * result_matrix.width + check_row_number) = *(result_matrix.elements + check_string_number * result_matrix.width + check_row_number);
          // printf("OK\n");
        }
        //second_matrix.indicators[check_string_number] = second_matrix.elements + check_string_number * second_matrix.width;
      }
  }
	else if (degree > 1)
	{
		struct matrix result_matrix;
		result_matrix.height = (*i)->height;
		result_matrix.width = (*i)->width;
		result_matrix.indicators = (int **)malloc((result_matrix.height) * sizeof(int *));
		result_matrix.elements = (int *)malloc((result_matrix.height * result_matrix.width) * sizeof(int));
		for (; operation < degree - 1; operation++)
		{
			if (operation < 1)
			{
				mult_matrix(&result_matrix, *i, *i);
			}
			else
			{
				struct matrix second_matrix;
				second_matrix.height = (*i)->height;
				second_matrix.width = (*i)->width;
				second_matrix.indicators = (int **)malloc((second_matrix.height) * sizeof(int *));
				second_matrix.elements = (int *)malloc((second_matrix.height * second_matrix.width) * sizeof(int));
				
				//printf("result_matrix.height = %d, result_matrix.width %d\n", result_matrix.height, result_matrix.width);
				for (int check_string_number = 0; check_string_number < result_matrix.height; check_string_number++)
				{
					for (int check_row_number = 0; check_row_number < result_matrix.width; check_row_number++)
					{
						//printf("check_string_number = %d, check_row_number = %d -> ", check_string_number, check_row_number);
						//printf("HERE1\n");
						*(second_matrix.elements + check_string_number * second_matrix.width + check_row_number) = *(result_matrix.elements + check_string_number * result_matrix.width + check_row_number);
						// printf("HERE2\n");
						// //printf("Added: %d\n", *(second_matrix.indicators[check_string_number] + check_row_number));
						// //*(second_matrix.elements + check_string_number * result_matrix.width + check_row_number) = *(result_matrix.elements + check_string_number * result_matrix.width + check_row_number);
						// printf("OK\n");
					}
					second_matrix.indicators[check_string_number] = second_matrix.elements + check_string_number * second_matrix.width;
				}

				//printf("\n\nCopyed matrix: \n");
				//output_matrix(&second_matrix);

				mult_matrix(&result_matrix, &second_matrix, *i);
				//free(*second_matrix);
			}
			

			// if (operation == 1)
			// 	mult_matrix(&result_matrix, &second_matrix, i);
			// else
			// 	mult_matrix(&result_matrix, &result_matrix, i);
			// printf("--->\n");
			// printf("operation / degree = %d / %d\n", operation + 1, degree - 1);
			// printf("After pow:\n\n");
			// printf("I:\n");
			// output_matrix(&result_matrix);
			// printf("<---\n");
		}

		// printf("--->\n");
		// printf("After pow:\n\n");
		// printf("I:\n");
		// output_matrix(&result_matrix);
		// printf("<---\n");

		if (operation == degree - 1)
		{
			for (int check_string_number = 0; check_string_number < result_matrix.height; check_string_number++)
			{
				for (int check_row_number = 0; check_row_number < result_matrix.width; check_row_number++)
				{
					*((*i)->elements + check_string_number * (*i)->width + check_row_number) = *(result_matrix.elements + check_string_number * result_matrix.width + check_row_number);
				}
				(*i)->indicators[check_string_number] = result_matrix.elements + check_string_number * result_matrix.width;
			}
			//printf("}\n");
			return SUCCESS_STATUS;
		}
		return ERROR_STATUS;
	}
	return SUCCESS_STATUS;
}

int mult_matrix(struct matrix *result_matrix, struct matrix *first_matrix, struct matrix *second_matrix)
{
	for (int check_string_number = 0; check_string_number < result_matrix->height; check_string_number++)
	{
		for (int check_row_number = 0; check_row_number < result_matrix->width; check_row_number++)
		{
			result_matrix->elements[check_string_number * result_matrix->width + check_row_number] = get_sum(first_matrix, second_matrix, check_string_number, check_row_number);
		}
		result_matrix->indicators[check_string_number] = result_matrix->elements + check_string_number * result_matrix->width;
	}
	return SUCCESS_STATUS;
}

int get_sum(struct matrix *first_matrix, struct matrix *second_matrix, int check_string_number, int check_row_number)
{
	int result_sum = 0;
	for (int check_string_number_second = 0, check_row_number_first = 0; check_string_number_second < second_matrix->height; check_string_number_second++, check_row_number_first++)
	{
		int first = *(first_matrix->indicators[check_string_number] + check_string_number_second);
		int second = *(second_matrix->indicators[check_string_number_second] + check_row_number);
		result_sum += first * second;
	}
	return result_sum;
}

int get_minimal_element(struct matrix *i, int is_vertical_matrix)
{
	int min_elem_str_pos = 0, minimanl_element_row_position = 0, minimanl_element = *(i->indicators[0] + 0);
	for (int check_string_number = 0; check_string_number < i->height; check_string_number++)
		for (int check_row_number = 0; check_row_number < i->width; check_row_number++)
		{
			if (minimanl_element > *(i->indicators[check_string_number] + check_row_number))
			{
				minimanl_element = *(i->indicators[check_string_number] + check_row_number);
				min_elem_str_pos = check_string_number;
				minimanl_element_row_position = check_row_number;
			}
		}
	if (is_vertical_matrix == SUCCESS_STATUS)
		return min_elem_str_pos;
	return minimanl_element_row_position;
}

int is_vertical_matrix(int *height, int *width)
{
	return *height > *width;
}

int is_square_matrix(int *height, int *width)
{
	if ((*width) == (*height))
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int is_correct_new_size(struct matrix *first_matrix, struct matrix *second_matrix)
{
	if (first_matrix->height == second_matrix->width)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

void free_matrix(struct matrix *temp_matrix)
{
	free(temp_matrix->indicators);
	free(temp_matrix->elements);
}


/*

if первый раз
  mult_matrix(&result_matrix, *i, *i);
второй раз
  mult_matrix(&result_matrix, &second_matrix, *i);

result 
mult(res, a, a); // res = a^2
a = res
*/
