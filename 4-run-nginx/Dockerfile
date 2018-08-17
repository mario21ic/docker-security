FROM alpine
MAINTAINER Mario Inga <mario21ic@gmail.com>

ENV APP_DIR=/apps
RUN apk update && apk add nginx && mkdir -p /run/nginx/ 
COPY default.conf /etc/nginx/conf.d/default.conf

RUN touch /var/run/nginx/nginx.pid && \
  chown -R nginx:nginx /var/run/nginx/ && \
  chown -R nginx:nginx /var/lib/nginx/

USER nginx

WORKDIR $APP_DIR
VOLUME $APP_DIR
EXPOSE 80

CMD nginx -g 'daemon off;'
