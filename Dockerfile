FROM nginx:latest

LABEL maintainer="girishbm4567"

RUN rm -f /usr/share/nginx/html/index.html

COPY build/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
