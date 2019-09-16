# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['EMAIL_SERVER'],
  :password => ENV['PASSWORD_SERVER'],
  :domain => 'argon-consult.com',
  :address => 'smtp.office365.com',
  :port => 587,
  :authentication => :login,
  :enable_starttls_auto => true
}
