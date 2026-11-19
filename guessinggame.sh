
#!/usr/bin/env bash

function count_files {
    find . -maxdepth 1 -type f | wc -l
}

correct=$(count_files)

echo "Welcome to the Guessing Game!"
echo "How many files are in this directory?"

while true
do
    echo "Enter your guess:"
    read -r guess

    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid number."
    elif [ "$guess" -lt "$correct" ]; then
        echo "Too low! Try again."
    elif [ "$guess" -gt "$correct" ]; then
        echo "Too high! Try again."
    else
        echo "Congratulations!"
        echo "You guessed correctly!"
        break
    fi
done

echo "Game finished!"
