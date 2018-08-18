FROM alpine
MAINTAINER Mario Inga <mario21ic@gmail.com>

ENV APP_DIR=/var/www/htdocs
RUN apk update && apk add nginx && mkdir -p /run/nginx/ 

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

RUN touch /var/run/nginx.pid && \
  chown nginx:nginx /var/run/nginx.pid && \
  chown -R nginx:nginx /var/log/nginx/ && \
  chown -R nginx:nginx /var/lib/nginx/ && \
  mkdir -p /var/www/htdocs && \
  chown -R nginx:nginx /var/www/htdocs

USER nginx

WORKDIR $APP_DIR
VOLUME $APP_DIR
EXPOSE 8080

CMD nginx -g 'daemon off;'
