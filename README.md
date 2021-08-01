# About

This project was made as a technical test for the Ruby Junior Full Stack Developer position at [Nuuvem](https://www.nuuvem.com/). The challenge was to create a web interface that accepts uploads of Tab Separated files containing specific informations about a Company's sales, normalize the data and store them in a relational database considering the model entities and their relationships.

# Installing

To install and run the application, the following steps are necessary:

- `bundle install`
- `yarn install`
- `rails db:create db:migrate`
- Open your server and access the application
- You can also run the automated tests on the terminal with `rails test`

The app was also deployed to Heroku on [this link](https://nuuvem-file-uploader.herokuapp.com/).

# How to use it

When the application is launched, the user will need to create an account using the Sign Up form.

With the created credentials, upload a file with the columns specified in the project (`purchaser name, item description, item price, purchase count, merchant address, merchant name`).

Different views were created to the main models (Company Sales, Merchants and Purchasers), showing overviews about their data, their relationships and other informations.
