#!/bin/bash

BACKUP_FILE=$1

if [ -z "$BACKUP_FILE" ]; then
    echo "Usage: ./restore.sh <backup-file>"
    exit 1
fi

echo "Restoring database..."

docker exec -i tripare-mysql mysql -u root -prootpassword <<EOF
DROP DATABASE IF EXISTS hotel_booking_db_restore;
CREATE DATABASE hotel_booking_db_restore;
EOF

docker exec -i tripare-mysql \
mysql -u root -prootpassword hotel_booking_db_restore \
< $BACKUP_FILE

echo "Restore completed successfully."
