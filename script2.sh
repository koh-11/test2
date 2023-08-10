#!/bin/bash

# A script that can be used to process different types of files.

read -p "Enter file full path: " path

if [ -f "$path" ]; then
    echo "File found."

    # Get the file extension
    extension="${path##*.}"

    case "$extension" in
        mp4|mkv|avi)
            echo "Playing video file..."
            sleep 2
            mpv "$path"
            ;;
        mp3|wav|flac)
            echo "Playing audio file..."
            sleep 2
            mpv "$path"
            ;;
        sh|bash|py|pl)
            echo "Running script file..."
            sleep 2
            chmod +x "$path"   # Ensure the script has executable permissions
            "$path"
            ;;
        *)
            echo "Opening file..."
            sleep 2
            vi "$path"
            ;;
    esac
else
    echo "File not found."
fi
