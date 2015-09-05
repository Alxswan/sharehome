class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
        t.text :name
    	t.text :address
    	t.text :description
    	t.text :image
    	t.text :apartment_number
    	t.text :street_number
    	t.text :city
    	t.text :state
    	t.text :country
    	t.text :zip
    	t.float :longitude
    	t.float :latitude
    	t.integer :block_id
    	t.integer :street_id

      t.timestamps null: false
    end
  end
end
