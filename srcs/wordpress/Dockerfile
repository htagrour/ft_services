FROM alpine:latest
COPY srcs /
EXPOSE 5050
RUN sh install.sh
WORKDIR /
CMD supervisord -n -c /etc/supervisord.conf 