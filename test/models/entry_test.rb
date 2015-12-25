# == Schema Information
#
# Table name: entries
#
#  id            :integer          not null, primary key
#  site_url      :string
#  entry_name    :string
#  entry_url     :string
#  entry_image   :string
#  entry_summary :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
