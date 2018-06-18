ARG NGINX_VERSION
FROM nginx:$NGINX_VERSION

RUN rm -f /etc/nginx/conf.d/*

COPY nginx.conf /etc/nginx/conf.d/webapp.conf
RUN cat /etc/nginx/conf.d/webapp.conf

ARG APP_NAME
RUN cat /etc/nginx/conf.d/webapp.conf | sed -e "s/{{APP_NAME}}/$APP_NAME/g" 1>/etc/nginx/conf.d/webapp.conf

CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf