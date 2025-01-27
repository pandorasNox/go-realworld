
# read env vars
include .env
export

#POSTGRESQL_URL="postgres://admin:admin@localhost:5432/conduit?sslmode=disable"

run:
	go run main.go

.PHONY: up
up:
	d8s up tilt up

.PHONY: down
down:
	d8s run tilt down
	d8s down

create-migration:
	migrate create -ext sql -dir postgres/migrations -seq $(file)

run-migration:
	migrate -database $(POSTGRESQL_URL) -path postgres/migrations up

down-migration:
	migrate -database $(POSTGRESQL_URL) -path postgres/migrations down $(v)

force-migration:
	migrate -database $(POSTGRESQL_URL) -path postgres/migrations force $(version)
