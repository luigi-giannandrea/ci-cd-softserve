FROM nginx:alpine
MAINTAINER luigi.giannandrea@gmail.com
COPY index.html /usr/share/nginx/html/index.html
COPY logo.png /usr/share/nginx/html/logo.png
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
