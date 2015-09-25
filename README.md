## Welcome to LMS project

This project helps student with education.

## Getting Started

1. First of all you must clone our repository:

         git clone git@github.com:szareey/LSM.git

2. Don't forget to create `config/database.yml`, you can
   see example from `config/database.yml.example`.

3. Then execute following commands:

         bin/rake db:create db:migrate db:seed

4. Start server with command:
     
         bin/rails s

   And than auth your account through google+, just click `Log in` button on main page.
5. Enter to the Rails console:

         bin/rails c

   And find your account:

         u = User.last

   Than set `is_admin` and `is_approved` to true

         u.is_admin = true
         u.is_approved = true
         u.save

6. Now you can access to the admin page `/admin`.

## Note

All accounts that authed through OAuth have `User::Student` type. If you want
to be a teacher, you must set field `type` in /admin or from console to `User::Teacher`.

## Deploying

To deploy app to the server you must:

1. Copy ssh key

         ssh-copy-id deployer@latentgems.com

   Password for the server you must request from the maintainer.
2. Make some project changes, then commit and push their to the master branch.
3. Deploy the app using command

         cap production deploy

NOTE: If you want to change configuration, you must request from the maintainer `shared` folder.
