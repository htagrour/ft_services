FROM alpine:3.11
COPY srcs /
RUN chmod +x entry_point.sh
RUN sh install.sh
EXPOSE 80 443 22
WORKDIR /
CMD ["sh", "entry_point.sh"]