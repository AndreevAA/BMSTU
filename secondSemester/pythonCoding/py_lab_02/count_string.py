def spl(temp):
	ans = []
	word = ""
	for i in range(len(temp)):
		if temp[i] == "+" or temp[i] == "-" or temp[i] == "*" or temp[i] == "/":
			ans.append(float(word))
			ans.append(temp[i])
			word = ""
		else:
			word += temp[i]
	ans.append(float(word))
	return ans

def calculate(temp):
	znak = [0, 0, 0, 0] # * / + - 
	for i in range(len(temp)):
		if temp[i] == "*":
			znak[0] += 1
		elif temp[i] == "/":
			znak[1] += 1
		elif temp[i] == "+":
			znak[2] += 1
		elif temp[i] == "-":
			znak[3] += 1
	#print(temp, znak)
	i = 0
	while znak[0] != 0:
		if temp[i] == "*":
			#print(temp, znak)
			temp[i - 1] = temp[i - 1] * temp[i + 1];
			del temp[i];
			del temp[i]
			znak[0] -= 1;
			i -= 1;
		else:
			i += 1
	i = 0
	while znak[1] != 0:
		if temp[i] == "/":
			#print(temp, znak)
			temp[i - 1] = temp[i - 1] / temp[i + 1];
			del temp[i];
			del temp[i]
			znak[1] -= 1;
			i -= 1;
		else:
			i += 1
	i = 0
	while znak[2] != 0:
		if temp[i] == "+":
			#print(temp, znak)
			temp[i - 1] = temp[i - 1] + temp[i + 1];
			del temp[i];
			del temp[i]
			znak[2] -= 1;
			i -= 1;
		else:
			i += 1
	i = 0
	while znak[3] != 0:
		if temp[i] == "-":
			#print(temp, znak)
			temp[i - 1] = temp[i - 1] - temp[i + 1];
			del temp[i];
			del temp[i]
			znak[3] -= 1;
			i -= 1;
		else:
			i += 1
	#print(temp)
	return str(temp[0])

def count(text):
	temp = "(" + text + ")"
	while temp.count(" ") != 0:
		left = 0;
		right = len(temp) - 1

		i = 0
		while True:
			if temp[i] == "(":
				left = i;
			elif temp[i] == ")":
				right = i
				temp = temp[:left] + calculate(spl((temp[left + 1:right]).replace(" ", ""))) + temp[right + 1:]
				#print(temp)
				break
			i += 1
	return temp

def main():
	text = input()
	print(count(text))

main()