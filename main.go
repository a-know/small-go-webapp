package main

import (
	"log"
	"net/http"

	"github.com/go-chi/chi"
)

func main() {

	r := chi.NewRouter()

	r.Get("/heartbeat", HandleHeartbeat)

	log.Printf("small-app started.")
	http.ListenAndServe(":8080", r)
}
