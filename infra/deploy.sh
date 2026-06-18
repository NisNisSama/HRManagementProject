#!/bin/bash

# Define where to store deployment logs
LOG_DIR="$HOME/HRManagementProject/infra/deployment_logs"
mkdir -p "$LOG_DIR"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
LOG_FILE="$LOG_DIR/deploy_$TIMESTAMP.log"

# Redirect ALL standard output (1) and errors (2) into the log file
exec > >(tee -a "$LOG_FILE") 2>&1

echo "========================================="
echo "🚀 DEPLOYMENT STARTED AT $(date)"
echo "========================================="

# Exit immediately if any command fails
set -e

echo "🔄 Pulling latest changes from GitHub..."
git pull origin main

# 2. Navigate to project root
cd "$(dirname "$0")"

echo "🛑 Stopping current containers..."
docker compose down

echo "🏗️ Rebuilding and starting Docker containers..."
docker compose up -d --build

echo "🧹 Cleaning up dangling Docker images..."
docker image prune -f

echo "========================================="
echo "DEPLOYMENT SUCCESSFUL AT $(date): saved at $LOG_FILE"
