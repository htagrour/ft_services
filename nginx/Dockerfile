FROM alpine 
COPY srcs /
RUN sh install.sh
EXPOSE 80 443 22
CMD ["sh", "entry_point.sh"]
