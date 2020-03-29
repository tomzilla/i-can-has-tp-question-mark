# Costco TP Checker
It will try to check if the Kirkland brand TP is in stock. When it's available, it will send an email to the chosen address.

This is not guaranteed to work.

# Requirements
NodeJS: https://nodejs.org/en/

It uses Gmail's SMTP server to send the email so you'll need a Google account. You'll need to generate an App password if you're using 2-factor authentication. https://myaccount.google.com/u/1/apppasswords

Chromium browser

For Debian-based systems
```
apt-get install chromium-browser
```
# Instructions

```
npm install
GMAIL_USER=[your full google username like your gmail address] GMAIL_PW=[app password] TO_EMAIL=[your email] node index.js
```
