# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  first_name    :string
#  last_name     :string
#  gender        :text
#  birth_date    :date
#  email         :string
#  mobile_number :integer
#  password      :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ActiveRecord::Base
  validates :first_name, :last_name,:birth_date,:mobile_number, presence: true
  has_many :cars, dependent: :destroy
end
