class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.text :image
    	t.text :first_name
    	t.text :last_name
    	t.text :email
    	t.text :phone
    	t.date :birthday
    	t.date :moved_in
    	t.integer :room_id
    	i.integer :location_id
    	t.boolean :is_house_admin
    	t.boolean :is_admin
      t.timestamps null: false
    end
  end
end
