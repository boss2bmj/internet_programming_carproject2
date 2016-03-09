rails g scaffold Car car_license:string description:text enter_date:date car_category:string car_subcategory:string

rails g scaffold CarStatus description:text status:boolean
rails g scaffold CarImage image_name:string

rails g paperclip CarImage image
