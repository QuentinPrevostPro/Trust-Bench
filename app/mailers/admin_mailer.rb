class AdminMailer < ApplicationMailer
  def send_confirmation(collected_data)
    @collected_data = collected_data
    mail(to: @collected_data.email, subject: "Trust&Bench - Votre demande a bien été prise en compte")
  end
  def send_csv_attachment(collected_data)
    @collected_data = collected_data
    attachments["#{DateTime.now.strftime("%Y%m%d")}_données_récupérées.csv"] = {mime_type: 'text/csv', content: File.read(Rails.root.join('collected_data.csv'))}
    attachments["#{DateTime.now.strftime("%Y%m%d")}_benchmark_associé.csv"] = {mime_type: 'text/csv', content: File.read(Rails.root.join('bench.csv'))}
    mail(to: "trust-bench@yopmail.com", subject: 'Une nouvelle demande a été faite sur Trust&Bench')
  end
end
