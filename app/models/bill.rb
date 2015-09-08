# == Schema Information
#
# Table name: bills
#
#  id         :integer          not null, primary key
#  bill_start :date
#  bill_end   :date
#  name       :text
#  bill_type  :text
#  amount     :integer
#  home_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bill < ActiveRecord::Base
	belongs_to :home
	belongs_to :user

	validates :bill_start, :presence => true
	validates :bill_end, :presence => true
	validates :name, :presence => true
	validates :amount, :presence => true
	validates :owner, :presence => true



end
