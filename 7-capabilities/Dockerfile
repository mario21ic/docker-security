FROM golang:alpine as builder
WORKDIR /
COPY ./main.go /
RUN go build /main.go

#FROM scratch
FROM alpine
COPY --from=builder /main /
CMD ["/main"]

