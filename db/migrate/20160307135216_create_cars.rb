class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :car_license
      t.text :description
      t.date :enter_date
      t.string :car_category
      t.string :car_subcategory

      t.timestamps null: false
    end
  end
end
