package main

import (
	"C"

	"github.com/nishanths/go-xkcd"
)
import "context"

//export GetXKCD
func GetXKCD(number int) (*C.char, *C.char) {
	client := xkcd.NewClient()
	ctx := context.TODO()
	comic, err := client.Get(ctx, number)
	if err != nil {
		panic(err)
	}
	return C.CString(comic.Title), C.CString(comic.ImageURL)
}

func main() {}
