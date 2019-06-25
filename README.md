# Movie Shop
An university project for Internet Applications created using RubyOnRails. 
Fell free to see my app on Heroku - https://my-movie-shop.herokuapp.com/

## Dependencies
:arrow_right: Ruby 2.6.1

:arrow_right: RubyOnRails  5.2.3

:arrow_right: MySQL 14.14

## Installation

``` bash
git clone https://github.com/Naylet/RailsShop.git
```

``` bash
cd RailsShop/
```

``` bash
bundle install
```

## Database creation
If you don't have MySQL on your computer run:

``` bash
sudo apt-get install mysql-server mysql-client libmysqlclient-dev
```
Then log in to MySQL console using:
``` bash
mysql -u root -p
```

or

``` bash
sudo mysql
```

Create an MySQL user, for example:
``` bash
CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON * . * TO 'newuser'@'localhost';
FLUSH PRIVILEGES;
```

In config/database.yml change username and password fields to 'newuser' and 'password'. 

You can also create in database an user called admin with password admin so you don't have to change anything in database.yml file.

## Database initialization

``` bash
rake db:create
rake db:migrate
```

or 

``` bash
rake db:setup
```

## Running
To run the app you just type:
``` bash
rails s
```

## Admin panel
If you want to use admin panel you need to create an admin.

``` bash
rails console
```
Below command to create an admin user called admin with password admin123.
``` rails
AdminUser.create(email:"admin",password:"admin123");
```

Admin panel under localhost:3000/admin
