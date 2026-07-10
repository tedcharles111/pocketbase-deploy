FROM alpine:3.19
COPY pocketbase /usr/local/bin/pocketbase
RUN chmod +x /usr/local/bin/pocketbase
COPY restore-pb.sh /app/restore-pb.sh
RUN chmod +x /app/restore-pb.sh
COPY pb_data /app/pb_data_seed
EXPOSE 8090
CMD ["/app/restore-pb.sh"]
