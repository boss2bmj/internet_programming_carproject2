
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



require 'rails_helper'

RSpec.describe CarStatus, type: :model do
  before(:each) do
    @car_status1 = CarStatus.new(description: "aaaa",status: false, created_at: "2016-03-18 13:44:04",
     updated_at: "2016-03-18 13:44:04", car_id: 1)
  end
  it "car status description cannot be blank should add" do
    @car_status1.description = ""
    @car_status1.status = false
    @car_status1.created_at = "2016-03-18 13:44:04"
    @car_status1.updated_at = "2016-03-18 13:44:04"
    @car_status1.car_id = 1
    expect(@car_status1.save).to be(false)
  end
  it "if have only description should be fine" do
    @car_status1.description = "bbbb"
    @car_status1.status = false
    @car_status1.created_at = ""
    @car_status1.updated_at = ""
    @car_status1.car_id = ""
    expect(@car_status1.save).to be(true)
  end
  it "if has car license should be fine" do
    @car_status1.description = "pppp"

    expect(@car_status1.save).to be(true)
  end

  it "if has everything should be ok" do
    expect(@car_status1.save).to be(true)
  end

end
