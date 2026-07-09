FROM alpine:3.19
COPY pocketbase /usr/local/bin/pocketbase
RUN chmod +x /usr/local/bin/pocketbase
COPY pb_data /pb/pb_data
EXPOSE 8090
CMD ["/usr/local/bin/pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/pb/pb_data"]
