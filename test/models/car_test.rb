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
#  user_id         :integer
#

require 'test_helper'

class CarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
