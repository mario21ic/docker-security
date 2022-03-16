package main

import (
	"net/http"
	"log"
        "fmt"
)

func main() {
    fmt.Println("Starting on port 81...")
    log.Fatalf("%v", http.ListenAndServe(":81", nil))
}
