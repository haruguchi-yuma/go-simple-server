FROM golang:1.22-alpine3.19 AS builder
WORKDIR /app
COPY . .
RUN go mod download
RUN go build -o main /app/main.go

FROM alpine:3.17
WORKDIR /app
COPY --from=builder /app/main .
EXPOSE 8008
CMD ["/app/main"]
