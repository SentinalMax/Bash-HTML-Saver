# Bash-HTML-Saver
Saves your index.html file to a newly created GitHub Repository as it pertains to Trinity's Cybersecurity Bootcamp PROJECT #1

This program took me a couple hours to script but well worth it knowing that my HTML code is now stored safely on my GitHub. Once you run the program (after chmod +X)-ing it, either using bash github_save.sh or ./github_save.sh it'll automatically create a new GitHub repository for you. NOTICE: you'll have to nano the program and edit the GITHUB_USERNAME and GITHUB_EMAIL parameters. You'll then be carried through a couple steps to authorize access to your GitHub (DM me if you need any help) after thats all done your index.html file will be safely stored on GitHub, and can be pulled down incase anything catastrophic happens. To do this just run: 'git add index.html && git commit -a && git push -u origin main' while in the /var/www/html directory, after you run the program. This is not at all necessary, but useful incase anything bad happens.

TO USE: (in your command line type the following to clone the repo in your current working directory)
'git clone https://github.com/SentinalMax/Bash-HTML-Saver.git'
