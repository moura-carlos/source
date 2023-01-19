CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',                        # required
    aws_access_key_id:     Rails.application.credentials[Rails.env.to_sym][:aws_access_key_id], # required unless using use_iam_profile
    aws_secret_access_key: Rails.application.credentials[Rails.env.to_sym][:aws_secret_access_key], # required unless using use_iam_profile
    region: 'us-west-2'
  }
  config.fog_directory = Rails.application.credentials[Rails.env.to_sym][:aws_bucket] # required
  config.cache_dir     = "#{Rails.root}/tmp/uploads"
  config.storage       = :fog
end
