# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  image               :text
#  first_name          :text
#  last_name           :text
#  email               :text
#  phone               :text
#  birthday            :date
#  moved_in            :date
#  room_id             :integer
#  location_id         :integer
#  is_house_admin      :boolean
#  is_admin            :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  password_digest     :text
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class User < ActiveRecord::Base
	has_secure_password
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	belongs_to :room
	has_one :home, :through => :room


	validates :email, :presence => true, :uniqueness => true, :on => :create
	validates :first_name, :presence => true
end
