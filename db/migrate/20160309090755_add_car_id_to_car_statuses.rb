class AddCarIdToCarStatuses < ActiveRecord::Migration
  def change
    add_column :car_statuses, :car_id, :integer
  end
end
