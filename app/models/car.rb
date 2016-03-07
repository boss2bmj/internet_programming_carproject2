class Car < ActiveRecord::Base
  validates :car_license, presence: true
end
