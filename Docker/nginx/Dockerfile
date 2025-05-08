FROM rockylinux/rockylinux:8.4
LABEL MAINTAINER="Ronald Andrade"
ENV PORT=80
RUN dnf install -y epel-release && \
    dnf install -y nginx && \
    dnf clean all

COPY /nginx/nginx.conf /etc/nginx/nginx.conf
EXPOSE $PORT
WORKDIR /etc/nginx
CMD ["sh", "-c", "mkdir -p /run/nginx && exec nginx -g 'daemon off;'"]