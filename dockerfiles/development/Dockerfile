FROM golang:1.18 as builder

WORKDIR /app

COPY . .

RUN go mod download

RUN make dev-tools 
