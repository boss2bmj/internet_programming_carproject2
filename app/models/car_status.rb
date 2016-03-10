class CarStatus < ActiveRecord::Base
  belongs_to :car
  has_many :car_images, dependent: :destroy
end
