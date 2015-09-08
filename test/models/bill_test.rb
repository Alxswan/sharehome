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

require 'test_helper'

class BillTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
