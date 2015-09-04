# == Schema Information
#
# Table name: rooms
#
#  id          :integer          not null, primary key
#  type        :text
#  occupant    :text
#  description :text
#  image       :text
#  rent        :integer
#  home_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Room < ActiveRecord::Base
	has_many :users
	belongs_to :home
end
