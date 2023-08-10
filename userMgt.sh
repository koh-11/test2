#!/bin/bash

# User Management Script
#This script assumes that it is being run with root or superuser privileges, as adding and deleting users typically requires administrative access.

# Function to add a new user
add_user() {
    read -p "Enter username: " username
    read -p "Enter full name: " full_name
    read -p "Enter password: " password
    
    # Create the user
    useradd -c "$full_name" -m "$username"
    #This line uses the useradd command to create a new user. The -c option is used to set the user's comment or full name, and the -m option is used to create the user's home directory.
    
    # Set the password for the user
    echo "$username:$password" | chpasswd
    #This line uses the echo command to concatenate the username and password with a colon separator, and then pipes the output to the chpasswd command. The chpasswd command is used to set the password for the user
    
    echo "User $username created successfully!"
}

# Function to delete a user
delete_user() {
    read -p "Enter username to delete: " username
    
    # Delete the user
    userdel -r "$username"
    #This line uses the userdel command with the -r option to delete the specified user. The -r option ensures that the user's home directory and files are also removed.
    
    echo "User $username deleted successfully!"
}

# Function to list all users

#These lines display a header for the user list and then use the cut command to extract the first field (username) from the /etc/passwd file, which contains information about all the users on the system. This effectively lists all the usernames.

list_users() {
    echo "List of users:"
    echo "--------------"
    cut -d: -f1 /etc/passwd
}

# Main menu
while true; do
    echo "User Management Script"
    echo "----------------------"
    echo "1. Add User"
    echo "2. Delete User"
    echo "3. List Users"
    echo "4. Exit"
    read -p "Enter your choice [1-4]: " choice

    case $choice in
        1)
            add_user
            ;;
        2)
            delete_user
            ;;
        3)
            list_users
            ;;
        4)
            exit 0
            ;;
        *)
            echo "Invalid choice! Please enter a number between 1 and 4."
            ;;
    esac

    echo
    #This line simply outputs a blank line for better readability.
done
