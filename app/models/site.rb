# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  site_name  :string
#  site_url   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Site < ActiveRecord::Base
  belongs_to :rsslist
  has_many :entries
end
