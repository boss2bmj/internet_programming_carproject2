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

class User < ActiveRecord::Base
  validates :first_name, :last_name,:mobile_number, presence: true
  has_many :cars, dependent: :destroy



  has_secure_password
end
