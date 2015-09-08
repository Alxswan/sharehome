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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
