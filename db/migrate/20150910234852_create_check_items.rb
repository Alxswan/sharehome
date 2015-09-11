class CreateCheckItems < ActiveRecord::Migration
  def change
    create_table :check_items do |t|
    	t.text :task
    	t.integer :user_id
    	t.integer :checklist_id
      t.timestamps null: false
    end
  end
end
