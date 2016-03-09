class CarImage < ActiveRecord::Base
  belongs_to :car_status
  
  has_attached_file :image, styles: { superlarge: "1200x560>",large: "700x700>", medium: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
