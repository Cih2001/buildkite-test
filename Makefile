dev-tools:
	@go install github.com/githubnemo/CompileDaemon@master
	@wget -O- -nv https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s v1.47.0

dev-build:
	@docker build -t order:dev -f ./dockerfiles/development/Dockerfile .

dev-up: dev-build
	@docker-compose up

build:
	@go build -o ./bin/order
