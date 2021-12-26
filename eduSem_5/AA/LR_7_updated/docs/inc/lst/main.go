package main

import (
	"fmt"
	"sort"

	"github.com/logrusorgru/aurora"

	"lab_07/dict"
)

func printRes(method string, res dict.Dict, count int) {
	fmt.Printf("%v ", aurora.Yellow(method+":"))
	if res["username"] == nil {
		fmt.Printf("%v\n\n", aurora.Red("There is no dict such key"))
	} else {
		fmt.Printf("%v [ %d ]\n", aurora.Green("Dict with specified key is found"), count)
		fmt.Println(res.ToString())
	}
}

func main() {
	fmt.Printf("%v", aurora.Magenta("Search in array of dict's\n\n"))

	darr := dict.CreateArray(10)
	farr := darr.FreqAnalysis()

	fmt.Printf("%v\n\n", aurora.Yellow("Dictionary data:"))
	darr.Print()

	var uname string
	fmt.Printf("%v ", aurora.Green("Key to find:"))
	fmt.Scanln(&uname)
	fmt.Println()

	c, v := darr.Brute(uname)
	printRes("Brute algorythm", v, c)

	sort.Slice(darr, func(i, j int) bool {
		return darr[i]["username"].(string) < darr[j]["username"].(string)
	})
	c, v = darr.Binary(uname)
	printRes("Binary search algorythm", v, c)

	c, v = farr.Combined(uname)
	printRes("Freq Analysis algorythm", v, c)
}
