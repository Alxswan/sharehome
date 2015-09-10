class AddHomeIdToMeetings < ActiveRecord::Migration
  def change
  	add_column :meetings, :home_id, :integer
  end
end
