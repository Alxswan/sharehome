class Checklist < ActiveRecord::Base
	has_many :check_items
	has_many :users, :through => :check_items
	belongs_to :home
	belongs_to :bill
	belongs_to :meeting
end
