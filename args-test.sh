#!/bin/bash

show_args() {
    echo "Function first argument: $1"
    echo "Function second argument: $2"
}

echo "Script first argument: $1"
echo "Script second argument: $2"

show_args website backup
