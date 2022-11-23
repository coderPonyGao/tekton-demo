FROM golang AS builder
WORKDIR /root/go/src/hello
ADD ./ ./
RUN go build -mod=vendor -o hello-world

FROM ubuntu
WORKDIR /usr/local/bin
COPY --from=builder /root/go/src/hello/hello-world /usr/local/bin
ENTRYPOINT ["/usr/local/bin/hello-world"]