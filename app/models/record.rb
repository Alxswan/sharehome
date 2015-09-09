class Record < ActiveRecord::Base
	belongs_to :user
	belongs_to :room
	belongs_to :home
end
