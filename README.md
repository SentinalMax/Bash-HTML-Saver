# Bash-HTML-Saver
Saves your index.html file to a newly created GitHub Repository as it pertains to the Trinity Cybersecurity Bootcamp PROJECT #1 (creating a webapp/blog)

This program took me a couple hours to script but well worth it knowing that my HTML code is now stored safely on my GitHub. Once you run the program (after chmod +X)-ing it, either using bash github_save.sh or ./github_save.sh it'll automatically create a new GitHub repository for you. NOTICE: you'll have to nano the program and edit the GITHUB_USER and GITHUB_EMAIL parameters. You'll then be carried through a couple steps to authorize access to your GitHub (DM me if you need any help) after thats all done your index.html file will be safely stored on GitHub, and can be pulled down incase anything catastrophic happens. To do this just run: 'git add index.html && git commit -a && git push -u origin main' while in the /var/www/html directory, after you run the program (you can also just RE-RUN the program for the same effect). This program is not at all necessary, but useful incase anything bad happens.

TO USE: (in your command line type the following to clone the repo in your current working directory)

1. 'git clone https://github.com/SentinalMax/Bash-HTML-Saver.git'
2. 'cd' into 'Bash-HTML-Saver'
3. Type 'nano github_save.sh'
4. Edit the 'GITHUB_USER' and 'GITHUB_EMAIL' to their respective credentials
5. When done with the above step, hit Ctrl + x than y to save changes 
5. Type 'chmod +X github_save.sh' to give execution permissions
6. Run the program either using 'bash github_save.sh' or './github_save.sh'
