Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://localhost:6379', namespace: 'rss' }
end

Sidekiq.configure_client do |config|
    config.redis = { url: 'redis://localhost:6379', namespace: 'rss' }
end