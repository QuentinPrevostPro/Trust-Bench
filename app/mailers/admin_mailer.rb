class AdminMailer < ApplicationMailer
  def send_csv
    mail(to: "trust-bench@yopmail.com", subject: "Test")

  end
end
