# README

This application was built using Rails, the Ruby framework, Ruby version '2.4.4'. The app consists of three models: Products, Categories, which did not need all the CRUD methods, since we'll be using a seed, and a join table that I called Matches (for lack of a better word), which helps the user add their products to one or more categories through a 'match'. The instances are saved into a postgresql database. To verify if the data is stored locally the command 'rails console' can be used in the terminal: 'Products.last' would retrieve the newest instance of Products, for example. The entire app can be test-run on localhost by following these steps in the terminal:

bundle install
yarn install
rails db:create db:migrate db:seed
rails s


When the application is opened, the homepage is the Categories index. I have also added a simple navbar to make navigation through the app easier.

The application allows a user to create a product with a title and descricption. I also added a 'creation_date' column, but realised it is completely redundant since the table already has a 'created at' column. Through the Product show page, the user can then add one or more categories to the product, and remove these if desired (so deleting the 'match').

All of the categories have their own show page, which list the products belonging to that category from newest to oldest (by using reated at). It shows the product names and descriptions.

The automated tests (rspec) can be run by typing 'rake' in the terminal.

I was very pleased to receive a challenge that was so clearly written, and at the same time very doable. Many to many relationships always need a bit of preparation (drawing the tables out before starting), but I enjoyed writing the code for this application and it was a great opportunity for me to test my own knowledge. I had never used haml before, and I learnt to write tests with rspec for this test, so feedback on that would be really helpful. Please do not hesitate to contact me if clarification is necessary. As indicated, this application did not need styled, therefore the front-end remains modest.
