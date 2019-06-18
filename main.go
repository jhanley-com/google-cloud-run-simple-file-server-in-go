package main

import (
	"log"
	"os"
	"net/http"
)

func main() {
	directory := "./data"

	port := os.Getenv("PORT")

	if port == "" {
		port = "8080"
	}

	http.Handle("/", http.FileServer(http.Dir(directory)))

	log.Printf("Serving %s on HTTP port %s\n", directory, port)

	log.Fatal(http.ListenAndServe(":" + port, nil))
}
