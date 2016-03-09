# Car Service

##Getting Start
To create new project run this command:

```bash
$ rails new internet_programming_carproject2
$ cd internet_programming_carproject2
```

##Devise gem

[Devise gem](https://github.com/plataformatec/devise)

First put devise in gemfile

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
end
```

##Add Car MVC
```
$ rails g scaffold Car car_license:string description:text enter_date:date car_category:string car_subcategory:string 
$ rails g scaffold CarStatus description:text status:boolean
$ rake db:migrate
```
>make sure that you not forget to run rake db:migrate




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


##Setting Models

To begin with ```user.rb```

```rb
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :cars
end
```
>I set that user has many cars

Next, ```car.rb```

```rb
class Car < ActiveRecord::Base
  validates :car_license, presence: true
  belongs_to :user
  has_many :car_statuses, dependent: :destroy
end
```

The reason that i set **dependent: :destroy** because if i delete car the car_staus will be deleted.
>car belong to user, and also car has many car status


last, ```car_status.rb```

```rb
class CarStatus < ActiveRecord::Base
  belongs_to :car
end
```
>car status belong to car


##Connect Table between Car and CarStatus



```bash
$ rails g migration add_car_id_to_car_statuses car_id:integer
$ rake db:migrate
```

First you have to change form_for in the form file:

```ruby
<%= form_for [@car,@car_status], html: { multipart: true } do |f| %>
```
>app/views/car_photos/_form.html.erb

Newt to make it nested loop:
```rb
resources :car_statuses, except:[:show, :index]
```

become like

```rb
resources :cars do
    resources :car_statuses, except:[:show, :index]
  end
```
>routes.rb



Then i go to add before_action, modify create, and add set_car

```rb
before_action :set_car
def create
    @car_status = CarStatus.new(car_status_params)
    @car_status.car_id = @car.id
    if @car_status.save
        redirect_to @car
      else
        render 'new'

      end
    end

# in private
def set_car
      @car = Car.find(params[:car_id])

    end
```
>app/controllers/car_statuses_controller.rb



To make the status show, i need to add ```@car_statuses = CarStatus.all```  ```@car_statuses = CarStatus.where(car_id: @car.id)``` 
in index, and also in show. 

```rb
def index
    @cars = Car.all
    @car_statuses = CarStatus.all
  end

  def show
    @car_statuses = CarStatus.where(car_id: @car.id)
  end
```
>app/controllers/cars_controller.rb

**Do not forget to change the path, if not it will error!!**

you can check route by type ```$ rake routes``` in your terminal.






##Add Image

gem "paperclip", "~> 4.3"

```bash
$ rails g scaffold CarPhoto image_name:string
```


```rb
class CarPhoto < ActiveRecord::Base
  belongs_to :car_detail
  has_attached_file :image, styles: { superlarge: "1200x560>",large: "700x700>", medium: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

```

>app/models/car_photo.rb


```bash
$ rails g paperclip CarPhoto image
```

to make photo pop up when choose

```html
<img id="output"/>

<%= f.file_field :image, onchange: "loadFile(event)" , accept:"image/*"  %>

<script>
  var loadFile = function(event) {
    var output = document.getElementById('output');
    output.src = URL.createObjectURL(event.target.files[0]);
  };
</script>


```

