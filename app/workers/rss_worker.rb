class RssWorker
  include Sidekiq::Worker
  sidekiq_options queue: :rss

  # def perform(id, url)
  #   @rsslist = Rsslist.find(id)
  #   @rsslist.update(url: url)
  # end
  def perform(id)
    urls = Rsslist.where(member_id: :id).pluck(:url)
    urls.each do |url|
        next unless feed = Feedbag.find(url).first
        site = Feedjira::Feed.fetch_and_parse(feed)
        Site.create(:site_name => site.title,
                    :site_url   => site.url)

        site.entries.each do |entry|
            Entry.create(:site_url   => site.url,
                         :entry_name   => entry.title,
                         :entry_url     => entry.url,
                         :entry_image   => entry.image,
                         :entry_summary => entry_summary)
        end
    end
  end
end
