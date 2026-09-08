FROM golang:1.27 AS builder

WORKDIR /app

COPY go.mod ./
COPY main.go ./

RUN go build -o yocrown-backend .

FROM debian:bookworm-slim

WORKDIR /app

COPY --from=builder /app/yocrown-backend .

EXPOSE 8080

CMD ["./yocrown-backend"]