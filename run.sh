#!/bin/sh
set -e

echo "Restoring database from S3 if needed..."
/usr/local/bin/litestream restore -if-db-not-exists -if-replica-exists /pb/pb_data/data.db

echo "Starting PocketBase with real‑time replication..."
exec /usr/local/bin/litestream replicate -exec "/pb/pocketbase serve --http=0.0.0.0:8090"
