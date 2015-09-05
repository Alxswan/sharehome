# == Schema Information
#
# Table name: homes
#
#  id               :integer          not null, primary key
#  address          :text
#  description      :text
#  image            :text
#  apartment_number :text
#  street_number    :text
#  city             :text
#  state            :text
#  country          :text
#  zip              :text
#  longitude        :float
#  latitude         :float
#  block_id         :integer
#  street_id        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  password_digest  :text
#

class Home < ActiveRecord::Base
	has_secure_password

	has_many :rooms
	has_many :users, :through => :rooms

	validates :address, :presence => true
	validates :description, :presence => true
end
