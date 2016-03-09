class CreateCarStatuses < ActiveRecord::Migration
  def change
    create_table :car_statuses do |t|
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
