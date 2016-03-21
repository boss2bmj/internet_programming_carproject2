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




require 'rails_helper'

RSpec.describe Car, type: :model do
  before(:each) do
    @car1 = Car.new(car_license:"aa-9999",
                      description:"paint",
                      enter_date: "2016-6-6",
                       car_category: "BMW",
                      car_subcategory: "series5",
                      user_id: 1)
  end

  it "car license cannot be blank shold add" do
    @car1.car_license = ""
    expect(@car1.save).to be(false)
  end

  it "if has car license should be fine" do
    @car1.car_license = "aa-0000"
    @car1.description = ""
    @car1.enter_date =""
    @car1.car_category =""
    @car1.car_subcategory =""
    @car1.user_id = ""

    expect(@car1.save).to be(true)
  end

  it "if has everything should be ok" do
    expect(@car1.save).to be(true)
  end

end
