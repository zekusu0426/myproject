class RsslistController < ApplicationController
  def index
    @favorites = Array.new
    urls = Rsslist.where(member_id: current_member.try(:id)).pluck(:url)

    urls.each do |url|
      next if feed = Feedbag.find(url).first
      site = Feedjira::Feed.fetch_and_parse(feed)
      site_data = Hash.new
      entries = Hash.new


      site.entries.each_with_index do |entry,i|
        entries[i] = {:entry_title   => entry.title,
                        :entry_summary => entry.summary,
                        :entry_image   => entry.image}
        break if i == 4
      end

      site_data = {:site_title => site.title,
                   :site_url   => site.url,
                   :entries    => entries }

      @favorites << site_data
    end
  end
end
