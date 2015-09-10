# == Schema Information
#
# Table name: meetings
#
#  id         :integer          not null, primary key
#  name       :string
#  start_time :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  home_id    :integer
#

class Meeting < ActiveRecord::Base
	belongs_to :home
end
