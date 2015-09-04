# == Schema Information
#
# Table name: homes
#
#  id               :integer          not null, primary key
#  address          :text
#  type             :text
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
#

class Home < ActiveRecord::Base
end
