# Car Service

##Getting Start
To create new project run this command:

```bash
$ rails new internet_programming_carproject2
$ cd internet_programming_carproject2
```
##Add Car MVC
```
$ rails g scaffold Car car_license:string description:text enter_date:date car_category:string car_subcategory:string 
$ rake db:migrate
```
>make sure that you not forget to run rake db:migrate



##Devise gem

[Devise gem](https://github.com/plataformatec/devise)

First putdevise in gemfile

```ruby
gem 'devise'
```
>Gemfile

And then run the commands below:

```bash
$ rails generate devise:install

$ rails generate devise Admin

$ rails generate devise User

$ rake db:migrate

$ rails g devise:views
```
>In this case, i design to create admin and user

