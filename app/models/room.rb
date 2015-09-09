# == Schema Information
#
# Table name: rooms
#
#  id           :integer          not null, primary key
#  occupant     :text
#  description  :text
#  image        :text
#  rent         :integer
#  home_id      :integer
#  user_movedin :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Room < ActiveRecord::Base
	belongs_to :home
	has_many :users
	has_many :records
	
end
