class RsslistController < ApplicationController
  def index
    # @rsslists = Rsslist.all
    @favorites = Array.new
    @urls = Rsslist.where(member_id: current_member.try(:id)).pluck(:url)
    @urls.each do |url|
      feed = Feedjira::Feed.fetch_and_parse(Feedbag.find(url).first)
      @favorites << feed
    end
  end
end
