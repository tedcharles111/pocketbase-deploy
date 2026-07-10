#!/bin/sh
# If the pb_data folder is empty (fresh deploy), copy the backup
if [ ! -f /pb/pb_data/data.db ]; then
    echo "Empty database, restoring from seed..."
    cp -r /app/pb_data_seed/* /pb/pb_data/
fi
# Start PocketBase normally
exec /usr/local/bin/pocketbase serve --http=0.0.0.0:8090 --dir=/pb/pb_data
