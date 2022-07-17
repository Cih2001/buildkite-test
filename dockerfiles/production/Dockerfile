FROM golang:1.18 as builder

WORKDIR /app

COPY . .

RUN go mod download

# Building for the alpine image, we have to disable cgo.
RUN CGO_ENABLED=0 go build -o server

# Run the service.
FROM alpine

WORKDIR /app

COPY --from=builder /app/server .

EXPOSE 8080

CMD ["./server"]
