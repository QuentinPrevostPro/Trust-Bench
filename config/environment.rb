# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'quentin.prevost@argon-consult.com',
  :password => 'Trust-bench',
  :domain => 'monsite.fr',
  :address => 'smtp.office365.com',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
