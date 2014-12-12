::SecureHeaders::Configuration.configure do |config|
  config.x_frame_options = 'DENY'
  config.x_content_type_options = "nosniff"
  config.x_xss_protection = {:value => 1, :mode => 'block'}
  config.csp = false #allow http
  # Uncomment the following after enabling https
  # config.csp = {
  #   :default_src => "https://* self",
  #   :img_src => "https://*",
  #   :report_uri => '//example.com/uri-directive'
  # }
end