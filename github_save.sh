#!/bin/bash
# Bash script I made to save your current HTML to /home directory
# Make sure to (chmod +X) the bash script before executing it
# To execute (./save_html) OR (bash save_html)

FILE=/var/www/html/index.html
REPO_PATH=/home/HTML

# You can either enter your credentials below OR follow the prompts
echo "Enter credentials below, if you already populated the required values in the code; feel free to leave these blank."
echo -n "Email (Tied to GitHub Account): " && read -r EMAIL
echo -n "Username (Tied to Github Account): " && read -r USERNAME

if [ -z $EMAIL ]
then
        #EMAIL empty
        if [ -z $USERNAME ]
        then
                #USERNAME empty
                echo "Both fields are blank, using hard-coded credentials."
                EMPTY=true
        else
                #USERNAME not empty
                echo 'Invalid credentials, a field was left blank.'
                exit
        fi
else
        #EMAIL not empty
        if [ -z $USERNAME ]
        then
                #USERNAME empty
                echo 'Invalid credentials, a field was left blank.'
                exit
        else
                #USERNAME not empty
                echo 'Both credentials entered.'
                EMPTY=false
        fi
fi

HC_EMAIL="GITHUB_EMAIL" # An email linked to your GitHub Account
HC_USERNAME="GITHUB_USER" # The username linked to your GitHub Account

if [ -f "$FILE" ]; then
        echo "creating new local folder (HTML) to /home"
        cd /home && mkdir HTML
        echo "$FILE exists -> copying to /home/HTML"
        cp $FILE /home/HTML && cd HTML

        if [ "$EMPTY" = true ]; then
                git config --global user.email $HC_EMAIL
                git config --global user.name $HC_USERNAME
        else
                git config --global user.email $EMAIL
                git config --global user.name $USERNAME
        fi

        # Do not touch this code unless you know what you're doing...
        echo "Installing GitHub CLI & dependencies"
        apt install apt-transport-https
        type -p curl >/dev/null || sudo apt install curl -y
        curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
        && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
        && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
        && sudo apt update \
        && sudo apt install gh -y

        # Initialize Repository
        echo "This is a copy of your 'index.html' file that exists in this DIR '/var/www/html' on your azure machine. You can run 'git add index.html && git commit -a && git push -u origin main' after executing the program on your azure machine to keep a backup stored on your Github Account." > README.md
        git init
        git add README.md && git add index.html
        git commit -am "initial commit"
        git branch -M main

        # You will be prompted to authenticate your login with Github, follow the prompts as you see fit.
        gh auth login
        gh repo create HTML --private --source=$REPO_PATH

        if [ "$EMPTY" = true ]; then
                git remote add origin https://github.com/$HC_USERNAME/Index.git
        else
                git remote add origin https://github.com/$USERNAME/Index.git
        fi

        git push -u origin main
fi
