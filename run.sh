#!/usr/bin/env sh

# Function to handle errors
handle_error() {
    echo "Error occurred: $1"
    exit 1
}

# Update the local repository
echo "Updating the local repository..."
git pull origin main || handle_error "Failed to pull from GitHub."

# Start the Minecraft server
echo "Starting Minecraft server..."
java @user_jvm_args.txt @libraries/net/minecraftforge/forge/1.20.1-47.3.0/unix_args.txt "$@" || handle_error "Failed to start Minecraft server."

# Commit and push changes
echo "Committing and pushing changes..."
git commit -am "Auto commit" || handle_error "Failed to commit changes."
git push origin main || handle_error "Failed to push changes to GitHub."
