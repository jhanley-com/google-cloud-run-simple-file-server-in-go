FROM golang
WORKDIR /go/src/app
COPY . .

RUN go build -v -o /app .

ENV PORT 8080

CMD ["/app"]
