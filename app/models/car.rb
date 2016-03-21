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

class Car < ActiveRecord::Base
  validates :car_license, presence: true
  belongs_to :user
  has_many :car_statuses, dependent: :destroy
  def status_percent_calculate(status=true)
    all = self.car_statuses.count
    done = self.car_statuses.where(status: status).count
    (done/all).to_f
  end
end
