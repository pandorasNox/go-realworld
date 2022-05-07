FROM docker.io/alpine:3.15.4 AS curl-tests

RUN apk update && apk add curl jq

# =============================================================================

FROM docker.io/postman/newman:5.3.1-alpine AS api-newman-tests

COPY ./api /api
RUN chmod +x /api/run-api-tests.sh
