# About

This project was made as a technical test for the Ruby Junior Full Stack Developer position at [Nuuvem](https://www.nuuvem.com/).

The challenge was to create a web interface that accepts uploads of Tab Separated files containing specific informations about a Company's sales, normalize the data and store them in a relational database considering the model entities and their relationships.

To see the technical test's full description and requirements, go to `public/technical_test/README.md`.

# Installing

To install and run the application, the following steps are necessary:

- Access the repo folder
- `git init` (if you've downloaded as zip)
- `bundle install`
- `yarn install`
- `rails db:create db:migrate`
- Open your server and access the application
- You can also run the automated tests on the terminal with `rails test`

The app was also deployed to [Heroku](https://nuuvem-file-uploader.herokuapp.com/) and the source code can be found on [GitHub](https://github.com/biancaferreiralp/file-uploader).

# How to use it

To use the application, it's necessary to create an account using the Sign Up form.

With the created credentials, upload a file with the columns specified in the project (`purchaser name, item description, item price, purchase count, merchant address, merchant name`) on the Import modal and submit.

You can find a valid example of the file at `public/technical_test/example_input.tab`.

Different views were created to the main models (Company Sales, Merchants and Purchasers), showing overviews about their data, their relationships and other general informations.
