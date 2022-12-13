#!/bin/bash
# Simple bash script I made to save your current HTML to /home directory
# Make sure to (chmod +X) the bash script before executing it
# To execute (./save_html) OR (bash save_html)

FILE=/var/www/html/index.html
REPO_NAME="INDEX-HTML"

if [ -f "$FILE" ]; then
        echo "creating new local folder (HTML) to /home"
        cd /home && mkdir HTML
        echo "$FILE exists -> copying to /home/HTML"
        cp $FILE /home/HTML

        # Here you'll enter the email tied to your GitHub account, as well as your Github Username
        git config --global user.email "EMAIL@EMAIL.com"
        git config --global user.name "GHUB_USERNAME"

        # Do not touch this code unless you know what you're doing...
        echo "installing GitHub CLI & dependencies"
        apt install apt-transport-https
        type -p curl >/dev/null || sudo apt install curl -y
        curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
        && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
        && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.l$
        && sudo apt update \
        && sudo apt install gh -y

        # You will be prompted to authenticate your login with Github, follow the prompts as you see fit.
        gh auth login
        gh repo create --source=/home/HTML --public #--push

        # Init Repo
        cd HTML
        echo "# This is a copy of your 'index.html' file that exists in this DIR '/var/www/html' on your azure machine. You can run 'git add index.html && git commit -a && git push -u origin main' after runnin$
        git init /home/HTML
        git add README.md && git add index.html
        git commit -am "initial commit"
        git branch -M main
        git push -u origin main
fi
