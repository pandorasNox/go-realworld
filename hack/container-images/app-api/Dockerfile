FROM docker.io/golang:1.18.1-alpine3.15 AS builder

WORKDIR /workdir

COPY . .

RUN go build -o=./server-api main.go

# =============================================================================

FROM docker.io/alpine:3.15.4 AS server

COPY --from=builder /workdir/server-api /server-api

ENTRYPOINT [ "/server-api" ]
