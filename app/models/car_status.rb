# == Schema Information
#
# Table name: car_statuses
#
#  id          :integer          not null, primary key
#  description :text
#  status      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  car_id      :integer
#

class CarStatus < ActiveRecord::Base
  validates :description, presence: true
  belongs_to :car
  has_many :car_images, dependent: :destroy
end
