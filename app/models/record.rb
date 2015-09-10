# == Schema Information
#
# Table name: records
#
#  id         :integer          not null, primary key
#  move_in    :date
#  move_out   :date
#  home_id    :integer
#  room_id    :integer
#  user_id    :integer
#  first_name :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Record < ActiveRecord::Base
	belongs_to :user
	belongs_to :room
	belongs_to :home
end
