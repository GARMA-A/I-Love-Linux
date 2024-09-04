#!/bin/bash
MY_VERY_SECRET_PASSWORD="199"

# Function to display data in an ASCII table format
display_table() {
    local header=("ID" "Name" "Age" "Email")
    local data=(
        "1" "Alice Johnson" "30" "alice.johnson@example.com"
        "2" "Bob Smith" "25" "bob.smith@example.com"
        "3" "Charlie Brown" "35" "charlie.brown@example.com"
        "4" "Diana Prince" "28" "diana.prince@example.com"
    )

    # Determine column widths
    local col_widths=()
    for h in "${header[@]}"; do
        col_widths+=($((${#h}+2)))
    done

    # Print the table header
    printf "+%s+\n" "$(printf "%s+" "$(printf '%s' "${col_widths[@]}" | tr ' ' '-')")"
    for i in "${!header[@]}"; do
        printf "| %-${col_widths[$i]}s" "${header[$i]}"
    done
    printf "|\n"
    printf "+%s+\n" "$(printf "%s+" "$(printf '%s' "${col_widths[@]}" | tr ' ' '-')")"

    # Print the table rows
    for ((i=0; i<${#data[@]}; i+=${#header[@]})); do
        for j in "${!header[@]}"; do
            printf "| %-${col_widths[$j]}s" "${data[$((i+j))]}"
        done
        printf "|\n"
    done
    printf "+%s+\n" "$(printf "%s+" "$(printf '%s' "${col_widths[@]}" | tr ' ' '-')")"
}

# Prompt the user for the password
read -p "Enter a Password: " password

clear

if [[ $password == $MY_VERY_SECRET_PASSWORD ]]; then
    echo "Wow! You are Smart or Lucky, this is the right Password!"
    display_table
else
    echo "Invalid Password"
    echo "Press 1 if you want to do a Brute Force Attack"
    echo "Press 2 if you want to respect the privacy and get out of here"
    read -p "Enter a number: " number
    clear   
    if [[ $number -eq 1 ]]; then
        echo "Brute Force Attack is started"
        while [[ $password != $MY_VERY_SECRET_PASSWORD ]]; do
            password=$(($RANDOM % 200))
            echo "Trying Password: $password"
            sleep 0.1
        done
        clear
        echo "The Correct Password is: $password"
        sleep 2
        echo "Trying to force login..."
        sleep 2
        echo "Force Login is Done"
        echo "Displaying the data of all users"
        sleep 2
        display_table
        echo "Happy Hacking!, you now have access to all the data"
    else
        echo "Goodbye, thank you for your respect!"
    fi
fi