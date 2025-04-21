#!/bin/bash
# Attendre que MySQL soit prêt à accepter des connexions
until nc -z -v -w30 mysql-db 3306
do
  echo "Waiting for MySQL..."
  sleep 5
done
echo "MySQL is up, starting Flask..."
exec python3 app.py
