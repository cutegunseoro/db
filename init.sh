#!/bin/bash
set -e

# Wait for MySQL to be ready
echo "Waiting for MySQL to be ready..."
until mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "SELECT 1" &>/dev/null; do
    sleep 2
done
echo "MySQL is ready!!!!!!!!!!!!!!"

# Run migration scripts
echo "Running migration scripts..."
for file in /docker-entrypoint-initdb.d/migrations/*.sql; do
    echo "Executing $file"
    mysql -u root -p"$DB_ROOT_PASSWORD" "$DB_DATABASE_NAME" < "$file"
done

# Run data seed scripts
echo "Running data seed scripts..."

if [ -d /docker-entrypoint-initdb.d/data ]; then
    for file in /docker-entrypoint-initdb.d/data/*.sql; do
        if [ -f "$file" ]; then
            echo "Executing $file"
            mysql -u root -p"$DB_ROOT_PASSWORD" "$DB_DATABASE_NAME" < "$file"
        else
            echo "No .sql files found in /docker-entrypoint-initdb.d/data."
        fi
    done
else
    echo "Data directory /docker-entrypoint-initdb.d/data does not exist. Skipping data seed scripts."
fi

echo "Database initialization completed!"
