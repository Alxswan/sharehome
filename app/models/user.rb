# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  image           :text
#  first_name      :text
#  last_name       :text
#  email           :text
#  phone           :text
#  birthday        :date
#  moved_in        :date
#  paypal_me       :text
#  room_id         :integer
#  location_id     :integer
#  is_house_admin  :boolean
#  is_admin        :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :text
#

class User < ActiveRecord::Base
	has_secure_password

	belongs_to :room
	has_many :bills
	has_many :messages
	has_many :records
	has_one :home, :through => :room
	has_many :check_items


	validates :email, :presence => true, :uniqueness => true, :on => :create
	validates :first_name, :presence => true
end
