package timi

import (
	"log"

	"v.src.corp.qihoo.net/nezha/sylvanas"

	"github.com/Shopify/sarama"
)

type Timi struct {
	Name string
}

func NewTimi(name string) (tm *Timi) {
	tm = &Timi{Name: name}
	return
}

func (tm *Timi) Display() {
	log.Printf("name : %s, MaxRequestSize : %v, ConfDir : %s", tm.Name, sarama.MaxRequestSize, sylvanas.ConfDir)
}
