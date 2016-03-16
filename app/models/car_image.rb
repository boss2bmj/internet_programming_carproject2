# == Schema Information
#
# Table name: car_images
#
#  id                 :integer          not null, primary key
#  image_name         :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  car_status_id      :integer
#

class CarImage < ActiveRecord::Base
  belongs_to :car_status

  has_attached_file :image, styles: { superlarge: "1200x560>",large: "700x700>", medium: "300x300>", thumb: "200x150#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
