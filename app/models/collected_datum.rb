class CollectedDatum < ApplicationRecord
  belongs_to :kpi
  belongs_to :approach
  belongs_to :activity
  belongs_to :size
  after_create :send_confirmation

  def self.to_csv
    attributes = %w{value numerator denominator first_name last_name email company position kpi_id approach_id activity_id size_id created_at}
    CSV.generate(headers: true, col_sep: ';', encoding: 'ISO-8859-1') do |csv|
      csv << attributes
      all.each do |collected_data| 
        csv << collected_data.attributes.values_at(*attributes)
      end
    end
  end

  private

  def send_confirmation
    if kpi_id == 1
      AdminMailer.send_confirmation(self).deliver_now
    end
  end
end
