


# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  gender          :text
#  birth_date      :date
#  email           :string
#  mobile_number   :text
#  password        :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#




require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user1 = User.new(first_name:"Peranat",
                      last_name:"Lappakobkit",
                      gender: "male",
                       mobile_number: "0891500555",
                      email: "boss2bmj@gmail.com",
                      password: "12345678" )
  end

  it "user should add Firstname, Lastname, and mobile number inorder to pass test" do
    @user1.first_name = ""
    @user1.last_name = ""
    @user1.mobile_number = ""
    @user1.save
    expect(@user1.save).to be(false)
  end

  it "user should add  Lastname, and mobile number inorder to pass test" do
    @user1.first_name = "boss"
    @user1.last_name = ""
    @user1.mobile_number = ""

    @user1.save
    expect(@user1.save).to be(false)
  end
  it "user should add  mobile number inorder to pass test" do
    @user1.first_name = "boss"
    @user1.mobile_number = ""

    @user1.save
    expect(@user1.save).to be(false)
  end
  it "user should pass test when add all first name, last name and mobile_number" do
    @user1.first_name = "boss"
    @user1.last_name = "2bmj"
    @user1.mobile_number = "0891500555"
    expect(@user1.save).to be(true)
  end
  it "if the data has every information it should be ok" do

    expect(@user1.save).to be(true)
  end

end
