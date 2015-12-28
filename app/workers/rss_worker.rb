class RssWorker
  include Sidekiq::Worker
  sidekiq_options queue: :rss

  # def perform(id, url)
  #   @rsslist = Rsslist.find(id)
  #   @rsslist.update(url: url)
  # end
  def perform(id)
    urls = Rsslist.where(member_id: id).pluck(:url)
    urls.each do |url|
        next unless feed = Feedbag.find(url).last
        site = Feedjira::Feed.fetch_and_parse(feed)
        Site.create(:site_name => site.title,
                    :site_url   => site.url)

        site.entries.each do |entry|
          /<img(.)src=\"?([-_.!~\\'()a-z0-9\;\/\?:@&=+\$\,\%#]+(jpg|jpeg|gif|png|bmp))/i =~ entry.content
            entry_image = $2
            Entry.create(:site_url   => site.url,
                         :entry_name   => entry.title,
                         :entry_url     => entry.url,
                         :entry_image   => entry_image,
                         :entry_summary => entry.summary)
        end
    end
  end
end
