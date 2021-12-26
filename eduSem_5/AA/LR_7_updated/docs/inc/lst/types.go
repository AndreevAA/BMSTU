package dict

type Dict map[string]interface{}

type DictArray []Dict

type Freq struct {
	l    string
	cnt  int
	darr DictArray
}

type FreqArray []Freq
