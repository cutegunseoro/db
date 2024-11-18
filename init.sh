#!/bin/bash
set -e

echo "Running migration SQL files..."
for file in /docker-entrypoint-initdb.d/migrations/*.sql; do
    echo "Executing $file"
    mysql --protocol=socket -uroot -p"${MYSQL_ROOT_PASSWORD}" "${MYSQL_DATABASE}" < "$file"
done

echo "Running seed data SQL files..."
for file in /docker-entrypoint-initdb.d/data/*.sql; do
    echo "Executing $file"
    mysql --protocol=socket -uroot -p"${MYSQL_ROOT_PASSWORD}" "${MYSQL_DATABASE}" < "$file"
done
