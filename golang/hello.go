package main

import "fmt"
import "C"

//export SayHello
func SayHello() {
	//fmt.Println("Hellow from go...")	
    fmt.Println("Hello from Go!")
}

func main() {}
