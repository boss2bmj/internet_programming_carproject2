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

require 'test_helper'

class CarImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
