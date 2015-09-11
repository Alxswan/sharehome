class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
    	t.text :name
    	t.integer :home_id
    	t.integer :bill_id
    	t.integer :meeting_id
      t.timestamps null: false
    end
  end
end
