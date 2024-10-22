#!/bin/bash

USER="USER"
PASSWORD='PASS'
HOST="localhost" # localhost or IP:PORT of your DB host

databases=$(mysql -u "$USER" -p"$PASSWORD" -h "$HOST" -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema|mysql)")

for db in $databases; do
  echo "Optimizing database: $db"

  tables=$(mysql -u "$USER" -p"$PASSWORD" -h "$HOST" -D "$db" -e "SHOW TABLES;" | grep -Ev "(Tables_in_)")

  for table in $tables; do
    echo "Optimizing table: $db.$table"
    mysql -u "$USER" -p"$PASSWORD" -h "$HOST" -D "$db" -e "OPTIMIZE TABLE \`$table\`;"
  done
done

echo "Optimization completed."
