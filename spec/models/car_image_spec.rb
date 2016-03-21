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



require 'rails_helper'

RSpec.describe CarImage, type: :model do
  before(:each) do
    @car_image1 = CarImage.new(id: 1, image_name: "aaaa",
     created_at: "2016-03-18 13:36:49",
      updated_at: "2016-03-18 13:36:49", image_file_name: "2015-Mercedes-Benz-CLS-Night-Package-1.jpg",
       image_content_type: "image/jpeg", image_file_size: 19668,
        image_updated_at: "2016-03-18 13:36:48", car_status_id: 1
)
  end

  it "if not have image some part should be fine" do
    @car_image1.id = 1
    @car_image1.image_name = "aaaa"
    @car_image1.created_at = ""
    @car_image1.updated_at = "2016-03-18 13:44:04"
    @car_image1.image_file_name = ""
    @car_image1.image_content_type = "image/jpeg"
    @car_image1.image_file_size = ""
    @car_image1.image_updated_at = "2016-03-18 13:36:48"

    @car_image1.car_status_id = 1
    expect(@car_image1.save).to be(true)
  end


  it "if not have image content type should fail" do
    @car_image1.id = 1
    @car_image1.image_name = "aaaa"
    @car_image1.created_at = "aaaa"
    @car_image1.updated_at = "2016-03-18 13:44:04"
    @car_image1.image_file_name = "bbb"
    @car_image1.image_content_type = ""
    @car_image1.image_file_size = 9999
    @car_image1.image_updated_at = "2016-03-18 13:36:48"

    @car_image1.car_status_id = 1
    expect(@car_image1.save).to be(false)
  end


  it "should have image_content_type to pass" do
    @car_image1.id =
    @car_image1.image_name = ""
    @car_image1.created_at = ""
    @car_image1.updated_at = ""
    @car_image1.image_file_name = ""
    @car_image1.image_content_type = "image/jpeg"
    @car_image1.image_file_size = ""
    @car_image1.image_updated_at = ""

    @car_image1.car_status_id =
    expect(@car_image1.save).to be(true)
  end
  it "if the content has every information, it should be ok" do

    expect(@car_image1.save).to be(true)
  end


end
