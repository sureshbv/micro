
# Stage 1 (to create a "build" image)
FROM golang:1.10.1 AS builder
RUN go version

WORKDIR /go/src/github.com/sureshbv/micro
COPY . .
RUN set -x && \
	go get github.com/golang/dep/cmd/dep && \
	dep ensure -v
RUN CGO_ENABLED=0 GOOS=linux go build -a -o eventservice
