package main

import (
	"log"

	"github.com/0xdod/go-realworld/server"
)

func main() {
	port := ":8000"
	srv := server.NewServer()
	log.Fatal(srv.Run(port))
}