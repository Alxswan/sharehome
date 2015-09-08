class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :home_id
      t.text :message

      t.timestamps null: false
    end
  end
end
