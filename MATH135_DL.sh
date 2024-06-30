#!/bin/bash

# Function to check if wget is installed
check_wget() {
    if ! command -v wget &> /dev/null; then
        echo "wget is not installed. Installing wget..."
        # Install wget based on package manager
        if command -v apt-get &> /dev/null; then
            sudo apt-get update
            sudo apt-get install -y wget
        elif command -v yum &> /dev/null; then
            sudo yum install -y wget
        else
            echo "Cannot install wget. Please install wget manually."
            exit 1
        fi
    fi
}

# Check if wget exists
check_wget

# Download lecture videos
for (( i=1; i<=26; i++ ))
do
    lecture_number=$(printf "%d" $i)  # Format number with leading zero if necessary
    url="https://www.math.uwaterloo.ca/~x46wang/MATH135/Lecture${lecture_number}.mp4"
    wget "$url"
done
