dev-tools:
	@go install github.com/githubnemo/CompileDaemon@master

dev-build:
	@docker build -t order:dev -f ./dockerfiles/development/Dockerfile .

dev-up: dev-build
	@docker-compose up

build:
	@go build -o ./bin/order

tests:
	@go test -v -race ./...
