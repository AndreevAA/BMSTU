ans = 0;
          num_e = 0; znak = []; pos_znak = []
          num_znak = 0; position_e = -1; position_znak = -1; point_position = -1; point_num = 0;
          for j in range(len(a[i])):
              print(a[i][j])
              if "0" <= a[i][j] <= "9":
                  ans += 1
              if a[i][j] == "e":
                  num_e += 1
                  position_e = j
              if a[i][j] == "+" or a[i][j] == "-":
                  if a[i][j] == "+":
                      znak.append(1)
                  if a[i][j] == "-":
                      znak.append(0)
                  num_znak += 1
                  position_znak = j
                  pos_znak.append(j)
              if a[i][j] == ".":
                  point_positon = j
                  point_num += 1
          
          if ans == len(a[i]):
              count += 1
          elif point_num == 0 and len(a[i]) == ans + num_znak + num_e and position_e > 0 and num_znak == 1 and num_e == 1 and position_e < position_znak and position_znak < len(a[i]) - 1:
              if (float(a[i])) == int(float(a[i])):
                  count += 1
              elif position_e < position_znak and znak == 0:
                  count += 1
          elif point_num == 1 and point_positon < position_e and len(a[i]) == ans + num_znak + num_e + point_num and num_e == 1 and num_znak == 1:
              if (float(a[i])) == int(float(a[i])):  
                  count += 1
              elif int(float(a[i])) == 0:
                  count += 1
          elif len(znak) > 0 and len(pos_znak) > 0:
              if znak[0] == 0 and position_znak == 0 and len(a[i]) == ans + num_znak and point_position <= position_e and num_znak == 1:
                  if (float(a[i])) == int(float(a[i])):  
                      count += 1
                  elif int(float(a[i])) == 0:
                      count += 1
              elif znak[0] == 0 and len(znak) == 2 and pos_znak[0] == 0 and pos_znak[1] > 1 and len(a[i]) == ans + num_znak + num_e + point_num and point_position <= position_e:
                  if (float(a[i])) == int(float(a[i])):  
                      count += 1
                  elif int(float(a[i])) == 0:
                      count += 1
              elif znak[0] == 0 and len(znak) == 2 and pos_znak[0] == 0 and pos_znak[1] > 1 and len(a[i]) == ans + num_znak + num_e + point_num and point_position <= position_e:
                  if (float(a[i])) == int(float(a[i])):  
                      count += 1
                  elif int(float(a[i])) == 0:
                      count += 1
              elif znak[0] == 0 and len(znak) == 1 and  pos_znak[0] > 1 and len(a[i]) == ans + num_znak + num_e + point_num and point_position <= position_e and position_e < position_znak:
                  if (float(a[i])) == int(float(a[i])):  
                      count += 1
                  elif int(float(a[i])) == 0:
                      count += 1
