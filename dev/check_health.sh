#!/bin/bash

POD_NAME="$1"
NAMESPACE="$2"

if [ -z "$POD_NAME" ] || [ -z "$NAMESPACE" ]; then
    echo "Error: Pod name and namespace are required."
    exit 1
fi

if kubectl get pod "$POD_NAME" -n "$NAMESPACE" &> /dev/null; then
    if kubectl get pod "$POD_NAME" -n "$NAMESPACE" -o 'jsonpath={.status.conditions[?(@.type=="Ready")].status}' | grep -q "True"; then
        echo "Pod is running and healthy."
    else
        echo "Pod is running but not ready."
    fi
else
    echo "Pod is not running."
fi
