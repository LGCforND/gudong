FROM nginx:alpine
WORKDIR /
ADD ./public /usr/share/nginx/html
COPY ./nginx_conf/gudong.conf /etc/nginx/conf.d/
EXPOSE 80
ENV NAME Gic
CMD ["nginx", "-g", "daemon off;"]