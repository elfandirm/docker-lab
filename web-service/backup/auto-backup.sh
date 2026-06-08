#!/bin/sh
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="/backup/labdb_${TIMESTAMP}.dump"
pg_dump -U labuser -d labdb -Fc -f "$BACKUP_FILE"
echo "[$(date)] Backup created: $BACKUP_FILE"

# Hanya jalankan rm jika find menemukan file (menggunakan flag -r pada xargs)
find /backup -name "labdb_*.dump" -mtime +7 | xargs -r rm -f
