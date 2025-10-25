#!/bin/bash

set -e

WORKSPACE="/workspace"
TIMEOUT=5

# Function to handle timeout
timeout_handler() {
    echo "TIME_LIMIT_EXCEEDED"
    exit 124
}

trap timeout_handler SIGTERM

# Detect language and file
if [ -f "$WORKSPACE/Main.java" ]; then
    LANG="java"
    FILE="Main.java"
elif [ -f "$WORKSPACE/main.py" ]; then
    LANG="python"
    FILE="main.py"
elif [ -f "$WORKSPACE/main.cpp" ]; then
    LANG="cpp"
    FILE="main.cpp"
else
    echo "ERROR: No source file found"
    exit 1
fi

cd "$WORKSPACE"

# Compile and run based on language
case $LANG in
    java)
        # Compile Java
        javac "$FILE" 2>&1
        if [ $? -ne 0 ]; then
            echo "COMPILATION_ERROR"
            exit 1
        fi
        
        # Run Java (read from stdin, write to stdout)
        timeout $TIMEOUT java Main
        EXIT_CODE=$?
        ;;
        
    python)
        # Run Python (read from stdin, write to stdout)
        timeout $TIMEOUT python3 "$FILE"
        EXIT_CODE=$?
        ;;
        
    cpp)
        # Compile C++
        g++ -o main "$FILE" 2>&1
        if [ $? -ne 0 ]; then
            echo "COMPILATION_ERROR"
            exit 1
        fi
        
        # Run C++
        timeout $TIMEOUT ./main
        EXIT_CODE=$?
        ;;
        
    *)
        echo "ERROR: Unsupported language"
        exit 1
        ;;
esac

# Handle exit code
if [ $EXIT_CODE -eq 124 ]; then
    echo "TIME_LIMIT_EXCEEDED"
    exit 124
elif [ $EXIT_CODE -ne 0 ]; then
    echo "RUNTIME_ERROR"
    exit $EXIT_CODE
fi

exit 0