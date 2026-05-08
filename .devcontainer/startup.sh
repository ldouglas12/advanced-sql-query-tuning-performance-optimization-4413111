export PGPASSWORD=postgres

# Wait for PostgreSQL to be ready
until psql -h 127.0.0.1 -U postgres -c '\q' 2>/dev/null; do
  echo "Waiting for PostgreSQL to be ready..."
  sleep 2
done

# Run an initial setup script for the PostgreSQL database
if [ -f .devcontainer/setup-postgresql.sql ]; then
  psql -h 127.0.0.1 -U postgres postgres < .devcontainer/setup-postgresql.sql
fi
