class AdminMailer < ApplicationMailer
  def send_confirmation
    mail(to: "trust-bench@yopmail.com", subject: "Confirmation")
  end
  def send_csv_attachment
    attachments['my_file_name.csv'] = {mime_type: 'text/csv', content: File.read(Rails.root.join('collected_data.csv'))}
    mail(to: "prevostq@gmail.com", subject: 'CSV')
  end
end
