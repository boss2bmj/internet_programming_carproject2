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

require 'test_helper'

class CarStatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
