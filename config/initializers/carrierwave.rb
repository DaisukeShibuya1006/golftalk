CarrierWave.configure do |config|
 if Rails.env.production?
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['aws_access_key_id'],
    aws_secret_access_key: ENV['aws_secret_access_key'],
    region: 'ap-northeast-1'
  }
  config.fog_provider = 'fog/aws'
  config.fog_directory = 'rails-photo-1006'
  config.cache_storage = :fog

 else
   config.storage :file
 end
end
