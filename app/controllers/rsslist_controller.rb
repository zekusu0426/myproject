class RsslistController < ApplicationController
  def index
    # @rsslists = Rsslist.all
    @rsslists = Rsslist.where("member_id = #{current_member.try(:id)}")
  end
end
