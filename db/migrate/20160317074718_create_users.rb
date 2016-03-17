class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :gender
      t.date :birth_date
      t.string :email
      t.integer :mobile_number
      t.text :password

      t.timestamps null: false
    end
  end
end
