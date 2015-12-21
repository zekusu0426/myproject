# == Schema Information
#
# Table name: rsslists
#
#  id         :integer          not null, primary key
#  url        :string
#  member_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_rsslists_on_member_id                 (member_id)
#  index_rsslists_on_member_id_and_created_at  (member_id,created_at)
#

require 'test_helper'

class RsslistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
