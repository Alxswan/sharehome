class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
    	t.date :bill_start
    	t.date :bill_end
    	t.text :name
    	t.text :bill_type
      t.text :image
    	t.integer :amount
    	t.integer :home_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
