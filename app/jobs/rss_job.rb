class RssJob < ActiveJob::Base
  queue_as :default

  def perform(message)
    Site.new.exec(message)
  end
end
