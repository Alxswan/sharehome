# == Schema Information
#
# Table name: homes
#
#  id               :integer          not null, primary key
#  name             :text
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

require 'test_helper'

class HomeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
