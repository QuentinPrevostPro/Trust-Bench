class CollectedDatum < ApplicationRecord
  belongs_to :kpi
  belongs_to :approach
  belongs_to :activity
  belongs_to :size
  after_create :send_confirmation

  private

  def send_confirmation
    if kpi_id == 1
      AdminMailer.send_confirmation.deliver_now
    end
  end
end
