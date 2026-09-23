#!/bin/bash

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="backup_${TIMESTAMP}.sql"

echo "Creating backup..."

docker exec tripare-mysql \
mysqldump -u root -prootpassword hotel_booking_db \
> ${BACKUP_FILE}

echo "Backup created: ${BACKUP_FILE}"
