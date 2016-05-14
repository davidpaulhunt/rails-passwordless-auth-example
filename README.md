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

## License

The MIT License (MIT)

Copyright (c) 2016 David Hunt

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
