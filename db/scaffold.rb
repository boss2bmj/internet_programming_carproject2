rails g scaffold Car car_license:string description:text enter_date:date car_category:string car_subcategory:string

rails g scaffold CarStatus description:text status:boolean
rails g migration add_car_id_to_car_statuses car_id:integer
rails g scaffold CarImage image_name:string

rails g paperclip CarImage image

rails g migration add_car_status_id_to_car_images car_status_id:integer




rails g scaffold User first_name:string last_name:string gender:text birth_date:date email:string mobile_number:integer password:text
