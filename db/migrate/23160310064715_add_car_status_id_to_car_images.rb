class AddCarStatusIdToCarImages < ActiveRecord::Migration
  def change
    add_column :car_images, :car_status_id, :integer
  end
end
