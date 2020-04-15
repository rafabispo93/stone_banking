#!/bin/sh

set -e


# Ensure the app's dependencies are installed
mix deps.get

echo "\nPostgres is available: database setup..."

# Potentially Set up the database
mix ecto.create
mix ecto.migrate -r Banking.Repo

echo "\nTesting the installation..."
# "Prove" that install was successful by running the tests
mix test

echo "\n Launching Phoenix web server..."
# Start the phoenix web server
mix phx.server