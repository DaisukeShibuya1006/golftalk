CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIA5TSFLNW6NR7LEXP7',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
  }

  config.fog_directory = 'rails-photo-1006'
  config.cache_storage = :fog
end
