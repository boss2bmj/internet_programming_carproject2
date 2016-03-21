# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

RSpec.describe Admin, type: :model do
  before(:each) do
    @admin1 = Admin.new(email: "boss2bmj@gmail.com",
                      password: "12345678",
                      password_confirmation: "12345678")
    @admin2 = Admin.new(email: "boss@gmail.com",
                      password: "12345678",
                      password_confirmation: "12345678")
  end

  it "admin1 should have ability to sign up" do
    expect(@admin1.save).to be(true)
  end
  it "email cannot be blank" do
    @admin1.email = ""
    @admin1.password = "1"*8

    expect(@admin1.save).to be(false)
  end
  it "password cannot be blank" do
    @admin1.email = "boss2bmj@gmail.com"
    @admin1.password = ""

    expect(@admin1.save).to be(false)
  end
  it "when sign up, user should use email" do
    @admin1.email = "boss2bmj"

    expect(@admin1.save).to be(false)
  end
  it "admin name should be unique and incase-sensitive" do
    @admin1.email = "boss2bmj@gmail.com"
    @admin1.save
    @admin2.email = "Boss2bmj@gmail.com"
    expect(@admin2.save).to be(false)
  end

  it "password have length max" do
    @admin1.password = "1"*5
    @admin1.password_confirmation = "1"*5
    expect(@admin1.save).to be(false)
  end

  it "password and password_confirmation should be the same" do
    @admin1.password = "1"*8
    @admin1.password_confirmation = "2"*8
    expect(@admin1.save).to be(false)
  end

  it "password and password_confirmation should be the same" do
    @admin1.password = "1"*8
    @admin1.password_confirmation = "1"*8
    expect(@admin1.save).to be(true)
  end




end
