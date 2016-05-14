# A Rails 5.0 Passwordless Authentication Example
**NOT PRODUCTION READY, EXPERIMENTATION ONLY**
* rails 5.0.0.beta4
* ruby 2.2.3
* sqlite3

## Getting started
Install necessary gems

`$ bundle install`

Setup the database

`$ bundle exec rails _5.0.0.beta4_ db:create db:migrate`

Run the server

`$ bundle exec rails _5.0.0.beta4_ s`

## How it authenticates

Rather than require a user to create a password, it is assumed users will use a private email address only they have access to.

#### Signup/Signin Flow

1. User signs up with an email
2. A link with a one time use `auth_token` is generated and emailed to the user
3. The user follows the link before the token expires (10 minutes)
4. A longterm-use `access_token` (expires after 30 days) is returned to the user
