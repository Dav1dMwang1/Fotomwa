# # Server
Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:7959/0' }
end
# # Client
Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:7959/0' }
end