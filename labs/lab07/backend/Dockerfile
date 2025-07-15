# Build stage
FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o hello main.go

# Final image
FROM alpine:3.19
WORKDIR /app
COPY --from=builder /app/hello ./hello
CMD ["/app/hello"]