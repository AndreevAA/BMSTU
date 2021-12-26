package dict

import (
	"crypto/sha256"
	"encoding/hex"
	"fmt"
	"math/rand"
	"reflect"
	"sort"

	"github.com/brianvoe/gofakeit"
)

func CreateArray(n int) DictArray {
	var (
		darr DictArray
		g    Dict
	)

	darr = make(DictArray, n)

	hash := sha256.New()
	for i := 0; i < n; i++ {
		dup := true
		for dup {
			hash.Reset()
			hash.Write([]byte(gofakeit.Password(true, true, true, true, true, i)))
			g = Dict{
				"username": gofakeit.Username(),
				"password": hex.EncodeToString(hash.Sum(nil)),
			}
			dup = g.IsDup(darr[:i])
		}

		darr[i] = g
	}

	return darr
}

func (d Dict) IsDup(darr DictArray) bool {
	for _, v := range darr {
		if reflect.DeepEqual(d, v) {
			return true
		}
	}
	return false
}

func (d Dict) ToString() string {
	return fmt.Sprintf("Username: %v\nPassword: %v\n", d["username"], d["password"])
}

func (darr DictArray) Print() {
	for _, d := range darr {
		fmt.Println(d.ToString())
	}
}

func (darr DictArray) Pick(l string) string {
	for _, d := range darr {
		if d["username"].(string)[:1] == l {
			return d["username"].(string)
		}
	}

	i := rand.Int() % len(darr)

	return darr[i]["username"].(string)
}

func (darr DictArray) Brute(uname string) (int, Dict) {
	var r Dict

	for i, d := range darr {
		if d["username"] == uname {
			return i + 1, d
		}
	}

	return len(darr), r
}

func (darr DictArray) Binary(uname string) (int, Dict) {
	var binary func(DictArray, string, int) (int, Dict)

	binary = func(arr DictArray, uname string, idx int) (int, Dict) {
		var (
			l   int = len(arr)
			mid int = l / 2
			r   Dict
		)

		switch {
		case l == 0:
			return idx, r
		case arr[mid]["username"].(string) > uname:
			return binary(arr[:mid], uname, idx+1)
		case arr[mid]["username"].(string) < uname:
			return binary(arr[mid+1:], uname, idx+2)
		default:
			return idx + 2, arr[mid]
		}
	}

	return binary(darr, uname, 0)
}

func (darr DictArray) FreqAnalysis() FreqArray {
	farr := make(FreqArray, 0)

	for _, v := range darr {
		found := false
		for i := range farr {
			if v["username"].(string)[:1] == farr[i].l {
				farr[i].darr = append(farr[i].darr, v)
				farr[i].cnt++
				found = true
			}
		}

		if !found {
			a := Freq{
				l:    v["username"].(string)[:1],
				cnt:  1,
				darr: make(DictArray, 0),
			}
			a.darr = append(a.darr, v)
			farr = append(farr, a)
		}
	}

	for i := range farr {
		sort.Slice(farr[i].darr, func(l, m int) bool {
			return farr[i].darr[l]["username"].(string) < farr[i].darr[m]["username"].(string)
		})
	}

	sort.Slice(farr, func(i, j int) bool {
		return farr[i].cnt > farr[j].cnt
	})

	return farr
}

func (farr FreqArray) Combined(w string) (int, Dict) {
	var (
		l   string = w[:1]
		r   Dict
		cnt int = len(farr)
	)

	for i, d := range farr {
		if string(d.l) == l {
			var t int
			t, r = d.darr.Binary(w)
			cnt = i + 1 + t
		}
	}

	return cnt, r
}
