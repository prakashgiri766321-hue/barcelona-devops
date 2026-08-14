#!/bin/bash

# Check number of arguments
if [ $# -ne 2 ]; then
    echo "❌ Usage: ./deploy.sh <club> <project>"
    exit 1
fi

# Get arguments
club="$1"
project="$2"

# Check club
check_club() {
    club_name="$1"

    case "$club_name" in
        barcelona)
            echo "🔵🔴 Barcelona selected"
            return 0
            ;;
        psg)
            echo "🔵🔴 PSG selected"
            return 0
            ;;
        arsenal)
            echo "🔴 Arsenal selected"
            return 0
            ;;
        realmadrid)
            echo "⚪ Real Madrid selected"
            return 0
            ;;
        *)
            echo "❌ Unknown club: $club_name"
            return 1
            ;;
    esac
}

# Check project
check_project() {
    project_name="$1"

    case "$project_name" in
        website)
            echo "🌐 Deploying website..."
            return 0
            ;;
        api)
            echo "🔌 Deploying API..."
            return 0
            ;;
        server)
            echo "🖥️ Deploying server..."
            return 0
            ;;
        *)
            echo "❌ Unknown project: $project_name"
            echo "Allowed projects: website, api, server"
            return 1
            ;;
    esac
}

# Validate club
if ! check_club "$club"; then
    exit 1
fi

# Validate project
if ! check_project "$project"; then
    exit 1
fi

# Check index.html
if [ ! -f "index.html" ]; then
    echo "❌ index.html not found. Deployment stopped."
    exit 1
fi

# Create backup directory
mkdir -p ~/Devops/barcelona/backup

# Create timestamp
timestamp=$(date +%Y%m%d-%H%M%S)

# Create backup
if cp ~/Devops/barcelona/index.html \
   ~/Devops/barcelona/backup/index-$timestamp.html; then

    echo "✅ $club $project deployment SUCCESS"

    echo "$(date) - $club $project deployment SUCCESS" \
        >> ~/Devops/barcelona/logs/website.log

    exit 0

else

    echo "❌ $club $project deployment FAILED"

    echo "$(date) - $club $project deployment FAILED" \
        >> ~/Devops/barcelona/logs/website.log

    exit 1
fi
