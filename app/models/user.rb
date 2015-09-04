# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  image          :text
#  first_name     :text
#  last_name      :text
#  email          :text
#  phone          :text
#  birthday       :date
#  moved_in       :date
#  room_id        :integer
#  location_id    :integer
#  is_house_admin :boolean
#  is_admin       :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class User < ActiveRecord::Base
	belongs_to :room
end
