ActionMailer::Base.smtp_settings = {
  :address => "smtp.sendgrid.net",
  :port => '25',
  :domain => "vulcanik.com",
  :authentication => :plain,
  :user_name => "joseluis@vulcanik.com",
  :password => "jlt2055",
  :enable_stattls_auto => true
}