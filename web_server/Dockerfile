FROM nginx

COPY github-scorer.conf /etc/nginx/conf.d/nginx.conf
RUN rm -f /etc/nginx/conf.d/default.conf

ENV APP_HOST 192.168.99.100

