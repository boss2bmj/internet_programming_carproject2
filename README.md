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

After that i authenticate user and admin like example below:

```rb
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_admin!, only:[:new,:create, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:show]
end
```

##Search function


[Datatable](https://www.datatables.net)

```html
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>

<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/dataTables.bootstrap.min.css">

<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.js"></script>

<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.11/js/dataTables.bootstrap.min.js"></script>

<script>
  $(document).ready(function(){
    $('#datatable').DataTable( );
  });
</script>
```





http://localhost:3000/admins/sign_up

