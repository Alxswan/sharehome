# == Schema Information
#
# Table name: records
#
#  id         :integer          not null, primary key
#  move_in    :date
#  move_out   :date
#  home_id    :integer
#  room_id    :integer
#  user_id    :integer
#  first_name :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
