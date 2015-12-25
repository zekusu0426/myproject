class RssWorker
  include Sidekiq::Worker
  sidekiq_options queue: :rss

  def perform(id, url)
    @rsslist = Rsslist.find(id)
    @rsslist.update(url: url)
  end
end
