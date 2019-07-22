class Bench < ApplicationRecord
  belongs_to :kpi
  belongs_to :approach
  belongs_to :activity
  belongs_to :size

  def self.to_csv
    attributes = %w{approach_id kpi_id activity_id size_id median_value min_value max_value source created_at updated_at}
    CSV.generate(headers: true, col_sep: ';', encoding: 'ISO-8859-1') do |csv|
      csv << attributes
      all.each do |bench| 
        csv << bench.attributes.values_at(*attributes)
      end
    end
  end

  def self.import(file)
    
    CSV.foreach(file.path, headers: true).with_index do |row,index|
      Bench.all.each do |bench|
        #Benchmark archiving
        if index == 0
          BenchArchive.create(median_value:bench.median_value, min_value:bench.min_value, max_value:bench.max_value, source:bench.source, kpi_id:bench.kpi_id, approach_id:bench.approach_id, activity_id:bench.activity_id, size_id:bench.size_id)
        end
        #Benchmark update
        if bench.approach_id.to_s == row.first[1].split(";")[0] && bench.kpi_id.to_s == row.first[1].split(";")[1] && bench.activity_id.to_s == row.first[1].split(";")[2] && bench.size_id.to_s == row.first[1].split(";")[3]
          bench.update(median_value: row.first[1].split(";")[4], min_value: row.first[1].split(";")[5], max_value: row.first[1].split(";")[6], source: row.first[1].split(";")[7])  
        end
      end
    end
    

  end
end