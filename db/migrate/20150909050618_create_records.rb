class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.date :move_in
      t.date :move_out
      t.integer :home_id
      t.integer :room_id
      t.integer :user_id
      t.text :first_name
      t.timestamps null: false
    end
  end
end
