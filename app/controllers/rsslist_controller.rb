class RsslistController < ApplicationController
  before_action :sign_in_required
  def index
    @favorites = Array.new
    urls = Rsslist.where(member_id: current_member.try(:id)).pluck(:url)
    urls.each do |url|
      next unless feed = Feedbag.find(url).first
      site = Feedjira::Feed.fetch_and_parse(feed)
      site_data = Hash.new
      entries = Hash.new
      site.entries.each_with_index do |entry,i|
        entries[i] = {:entry_title   => entry.title,
                      :entry_url     => entry.url,
                      :entry_summary => entry.summary,
                      :entry_image   => entry.image}
        break if i == 4
      end

      site_data = {:site_title => site.title,
                   :site_url   => site.url,
                   :entries    => entries }
      @favorites << site_data
    end
    return @favorites
  end


  def new
    @rsslist = Rsslist.new
  end

  def create
    @rsslist = current_member.rsslists.build(rsslist_params)
    if @rsslist.save
      redirect_to(root_url)
    else
      render 'new'
    end
  end

  private
  def rsslist_params
    params.require(:rsslist).permit(:url)
  end
end
