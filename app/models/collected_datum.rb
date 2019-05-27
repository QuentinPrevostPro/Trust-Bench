class CollectedDatum < ApplicationRecord
  belongs_to :kpi
  belongs_to :approach
  belongs_to :activity
  belongs_to :size
  after_create :send_csv

  private

  def send_csv
    if kpi_id == 1
      AdminMailer.send_csv.deliver_now
    end
  end
end
