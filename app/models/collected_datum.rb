class CollectedDatum < ApplicationRecord
  belongs_to :kpi
  belongs_to :approach
  belongs_to :activity
  belongs_to :size
  after_create :send_confirmation

  validates :value,
  presence: true, 
  numericality: true
  validates :numerator, 
  presence: true,
  numericality: {greater_than: 0}
  validates :denominator, 
  presence: true,
  numericality: {greater_than: 0}
  validates :first_name, 
  presence: true
  validates :last_name, 
  presence: true
  validates :email, 
  presence: true,
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "should have an email format" }
  validates :company, 
  presence: true
  validates :position, 
  presence: true
  

  def self.to_csv
    attributes = %w{approach_id kpi_id activity_id size_id value numerator denominator first_name last_name email company position created_at}
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
