FROM alpine

RUN apk --no-cache add su-exec

ENV TMP_USER=dockerdev
ENV TMP_UID=1234
ENV TMP_GID=1234
ENV APP_DIR=/app

RUN adduser -h $APP_DIR -u $TMP_UID -g $TMP_GID -D $TMP_USER

COPY entrypoint.sh /root/entrypoint.sh

WORKDIR $APP_DIR

ENTRYPOINT ["/root/entrypoint.sh"]
CMD ["cat", "/tmp/secrets.txt"]

