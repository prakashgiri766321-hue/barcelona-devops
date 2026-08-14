#!/bin/bash

check_project() {
    project="$1"

    case "$project" in
        website)
            echo "🌐 Website is valid"
            return 0
            ;;
        api)
            echo "🔌 API is valid"
            return 0
            ;;
        server)
            echo "🖥️ Server is valid"
            return 0
            ;;
        *)
            echo "❌ Unknown project: $project"
            return 1
            ;;
    esac
}

check_project "$1"

if [ $? -eq 0 ]; then
    echo "Project check PASSED"
else
    echo "Project check FAILED"
fi
