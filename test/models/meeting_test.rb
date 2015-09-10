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

require 'test_helper'

class MeetingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
