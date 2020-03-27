# Costco TP Checker
It will try to check if the Kirkland brand TP is in stock. When it's available, it will send an email to the chosen address.

This is not guaranteed to work.

# Requirements
It uses Gmail's SMTP server to send the email so you'll need a Google account. You'll need to generate an App password if you're using 2-factor authentication. https://myaccount.google.com/u/1/apppasswords?

# Instructions

```
bundle

GMAIL_USER=[your full google username like your gmail address] GMAIL_PW=[app password] TO_EMAIL=[your email] be ruby tp.rb
```
