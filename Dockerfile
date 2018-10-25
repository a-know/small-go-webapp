# for build
FROM golang:1.10-alpine AS build

RUN apk update && apk upgrade \
    && apk add curl git

WORKDIR /go/src/github.com/a-know/small-go-webapp
COPY . .

RUN go get github.com/go-chi/chi
RUN go build -o small-go-webapp

# for artifacts
FROM golang:1.10-alpine
COPY --from=build /go/src/github.com/a-know/small-go-webapp/small-go-webapp /bin/small-go-webapp

EXPOSE 8080
RUN chmod +x /bin/small-go-webapp
CMD /bin/small-go-webapp
