class CollectedDatum < ApplicationRecord
  belongs_to :kpi
  belongs_to :approach
  belongs_to :activity
  belongs_to :size
  after_create :send_csv

  def send_csv
    AdminMailer.send_csv.deliver_now
  end
end
