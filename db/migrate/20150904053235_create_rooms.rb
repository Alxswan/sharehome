class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.text :occupant
    	t.text :description
    	t.text :image
    	t.integer :rent
    	t.integer :home_id

      t.timestamps null: false
    end
  end
end
