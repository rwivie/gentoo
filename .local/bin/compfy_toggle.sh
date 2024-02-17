#!/bin/bash

# Define the name of the program you want to check
PROGRAM_NAME="compfy"

# Check if the program is running
if pgrep -x "$PROGRAM_NAME" >/dev/null; then
    # Program is running, so kill it
    echo "The program $PROGRAM_NAME is running. Killing it..."
    pkill -x "$PROGRAM_NAME"
    echo "The program $PROGRAM_NAME has been killed."
else
    # Program is not running, so start it
    echo "The program $PROGRAM_NAME is not running. Starting it..."
    # Example command to start the program, replace it with the actual command
    # For example: /path/to/your/program
    compfy -b &
    echo "The program $PROGRAM_NAME has been started."
fi
