# == Schema Information
#
# Table name: cars
#
#  id              :integer          not null, primary key
#  car_license     :string
#  description     :text
#  enter_date      :date
#  car_category    :string
#  car_subcategory :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Car < ActiveRecord::Base
  validates :car_license, presence: true
  belongs_to :user
  has_many :car_statuses, dependent: :destroy
end
