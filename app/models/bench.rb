class Bench < ApplicationRecord
  belongs_to :kpi
  belongs_to :approach
  belongs_to :activity
  belongs_to :size

  def self.to_csv
    attributes = %w{approach_id kpi_id activity_id size_id median_value min_value max_value source created_at updated_at}
    CSV.generate(headers: true, col_sep: ';', encoding: 'CP1252') do |csv|
      csv << attributes
      all.each do |bench| 
        bench_label = bench.attributes.values_at(*attributes)
        bench_label[0] = Approach.all.find_by(id:bench.attributes.values_at(*attributes)[0]).label
        bench_label[1] = Kpi.all.find_by(id:bench.attributes.values_at(*attributes)[1]).label
        bench_label[2] = Activity.all.find_by(id:bench.attributes.values_at(*attributes)[2]).label
        bench_label[3] = Size.all.find_by(id:bench.attributes.values_at(*attributes)[3]).label
        csv << bench_label
      end
    end
  end

  def self.import(file)
    
    CSV.foreach(file.path, headers: true, encoding: 'CP1252').with_index do |row,index|
      Bench.all.each do |bench|
        #Benchmark archiving
        if index == 0
          BenchArchive.create(median_value:bench.median_value, min_value:bench.min_value, max_value:bench.max_value, source:bench.source, kpi_id:bench.kpi_id, approach_id:bench.approach_id, activity_id:bench.activity_id, size_id:bench.size_id)
        end
        #Benchmark update
        if bench.approach.label == row.first[1].split(";")[0] && bench.kpi.label == row.first[1].split(";")[1] && bench.activity.label == row.first[1].split(";")[2] && bench.size.label == row.first[1].split(";")[3]
          bench.update(median_value: row.first[1].split(";")[4], min_value: row.first[1].split(";")[5], max_value: row.first[1].split(";")[6], source: row.first[1].split(";")[7])
          return 1
        else
          return 0
        end
      end
    end
    

  end
end