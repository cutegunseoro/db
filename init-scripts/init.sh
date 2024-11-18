#!/bin/bash
set -e

# Run migration scripts
echo "Running migration scripts..."
for file in /docker-entrypoint-initdb.d/migrations/*.sql; do
    echo "Executing $file"
    mysql -u root -prootpassword mydatabase < "$file"
done

# Run data seed scripts
echo "Running data seed scripts..."
for file in /docker-entrypoint-initdb.d/data/*.sql; do
    echo "Executing $file"
    mysql -u root -prootpassword mydatabase < "$file"
done

echo "Database initialization completed!"
exec docker-entrypoint.sh "$@"
