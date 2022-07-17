package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"os"

	"github.com/google/uuid"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var id uuid.UUID = uuid.New()

func connectDB() *gorm.DB {
	dbAddress := os.Getenv("POSTGRES_ADDR")
	dbUser := os.Getenv("POSTGRES_USER")
	dbPass := os.Getenv("POSTGRES_PASSWORD")
	dbName := os.Getenv("POSTGRES_DB")

	log.Printf("Connecting to the database at %s", dbAddress)
	dsn := fmt.Sprintf("host=%s user=%s password=%s dbname=%s sslmode=disable", dbAddress, dbUser, dbPass, dbName)
	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		log.Fatalf("cannot connect to DB: %v", err)
	}

	log.Printf("Successfully connected to the database at %s", dbAddress)
	return db
}

func main() {
	_ = connectDB()

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		_, err := io.WriteString(w, fmt.Sprintf("hello again from %s\n", id))
		log.Print("request to: ", r.URL)
		if err != nil {
			log.Printf("Error handling request: %v\n", err)
		}
	})

	addr := "0.0.0.0:8080"
	log.Printf("Listening on %s\n", addr)

	err := http.ListenAndServe(addr, nil)
	if err != nil {
		log.Fatal(err)
	}
}
