Recaptcha.configure do |config|
  config.public_key  = Radicaos::config.recaptcha['public_key']
  config.private_key = Radicaos::config.recaptcha['private_key']
end