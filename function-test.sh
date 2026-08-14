#!/bin/bash

deploy_message() {
    project="$1"

    case "$project" in
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
            echo "❌ Unknown project: $project"
            return 1
            ;;
    esac
}

deploy_message website
echo "Website result: $?"

deploy_message pizza
echo "Pizza result: $?"
