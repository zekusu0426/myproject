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

class Rsslist < ActiveRecord::Base
  belongs_to :member

  default_scope -> { order(created_at: :desc) }
  validates :url, presence: true
  validates :member_id, presence: true
end
