class Bench < ApplicationRecord
  belongs_to :kpi
  belongs_to :approach
  belongs_to :activity
  belongs_to :size

  def self.to_csv
    attributes = %w{median_value min_value max_value source kpi_id approach_id activity_id size_id created_at}
    CSV.generate(headers: true, col_sep: ';', encoding: 'ISO-8859-1') do |csv|
      csv << attributes
      all.each do |bench| 
        csv << bench.attributes.values_at(*attributes)
      end
    end
  end

end
