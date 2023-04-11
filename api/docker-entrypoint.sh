#!/bin/bash

# Stop on errors
set -eo pipefail

if [ "$HOOD_DEPENDENCIES_WAIT" ]; then
    while true
    do
        if python /opt/api/wait-for-dependencies.py
        then
            break
        fi
        echo 'Dependencies is not ready - sleeping'
        sleep 1
    done
fi

if [ "$HOOD_DATABASE_MIGRATE" ]; then
    python manage.py migrate --noinput
fi

exec "$@"