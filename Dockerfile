FROM nginx
RUN rm -f /usr/share/nginx/html/index.html
COPY build/ /usr/share/nginx/html/
CMD ["nginx", "-g", "daemon off;"]
