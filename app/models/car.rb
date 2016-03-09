class Car < ActiveRecord::Base
  validates :car_license, presence: true
  belongs_to :user
  has_many :car_statuses, dependent: :destroy
end
