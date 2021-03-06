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

```bash
$ rails g scaffold User first_name:string last_name:string gender:text birth_date:date email:string mobile_number:integer password:text
$ rails g scaffold Car car_license:string description:text enter_date:date car_category:string car_subcategory:string
$ rails g scaffold CarStatus description:text status:boolean
$ rails g scaffold CarImage image_name:string
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
  has_many :cars, dependent: :destroy
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




##Connect Table between User and Cars













##Connect Table between Car and CarStatus



```bash
$ rails g migration add_car_id_to_car_statuses car_id:integer
$ rake db:migrate
```

First you have to change form_for in the form file:

```ruby
<%= form_for [@car,@car_status], html: { multipart: true } do |f| %>
```
>app/views/car_status/_form.html.erb

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
$ rails g scaffold CarImage image_name:string
```


```rb
class CarImage < ActiveRecord::Base
  belongs_to :car_status
  has_attached_file :image, styles: { superlarge: "1200x560>",large: "700x700>", medium: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

```

>app/models/car_image.rb


```bash
$ rails g paperclip CarImage image
$ rake db:migrate
```

To choose a image and make an image pop up when you choose, you need to add this form:

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
>app/views/car_images/_form.html.erb

Also you need to add ```:image``` in car image params:

```rb
def car_image_params
      params.require(:car_image).permit(:image_name, :image)
    end
```



##share image to each car



```bash
$ rails g migration add_car_status_id_to_car_images car_status_id:integer
$ rake db:migrate
```



```ruby
<%= form_for [@car,@car_status,@car_image], html: { multipart: true } do |f| %>
```
>app/views/car__images/ _form.html.erb


```rb
resources :car_images, except:[:show,:index]
```

become like

```rb
resources :cars do
    resources :car_statuses, except:[ :index] do
      resources :car_images, except:[:show,:index]
    end
  end
```
>routes.rb



Then i go to add before action, modify create, and add set_car

```rb
before_action :set_car_status
before_action :set_car

def create
    @car_image = CarImage.new(car_image_params)
    @car_image.car_status_id = @car_status.id
    if @car_image.save
        redirect_to car_car_status_path(@car_status,@car)

      else
        render 'new'

      end
    end
# in private
def set_car_status
      @car_status = CarStatus.find(params[:car_status_id])

    end
def set_car
      @car = Car.find(params[:car_id])

    end
```
>app/controllers/car_images_controller.rb



To make the status show, i need to add ```@car_images = CarImage.all```  ```@car_images = CarImage.where(car_status_id: @car_status.id)```
in index, and also in show by order.

```rb
def index
    @cars = Car.all
    @car_statuses = CarStatus.all
  end

  def show
    @car_statuses = CarStatus.where(car_id: @car.id)
  end
```
>app/controllers/car_statuses_controller.rb

**Do not forget to change the path, if not it will error!!**

you can check route by type ```$ rake routes``` in your terminal.
