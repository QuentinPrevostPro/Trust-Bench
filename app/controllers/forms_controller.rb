class FormsController < ApplicationController
  def index
    @approaches = Approach.all
  end
  def create
    @csv_array = []

    #Size Category
    if params[:collected_datum][:ca_globale].to_f <= 500 #CA inférieur à 500M€
      params[:collected_datum][:size] = "1"
    elsif params[:collected_datum][:ca_globale].to_f > 500 && params[:collected_datum][:ca_globale].to_f <= 1000 #CA entre 500M€ et 1Mrd€
      params[:collected_datum][:size] = "2"
    elsif params[:collected_datum][:ca_globale].to_f > 1000 && params[:collected_datum][:ca_globale].to_f <= 10000 #CA entre 1Mrd€ et 10Mrd€
      params[:collected_datum][:size] = "3"
    elsif params[:collected_datum][:ca_globale].to_f > 10000 && params[:collected_datum][:ca_globale].to_f <= 50000 #CA entre 10Mrd€ et 50Mrd€
      params[:collected_datum][:size] = "4"
    elsif params[:collected_datum][:ca_globale].to_f > 50000 #CA supérieur à 50Mrd€
      params[:collected_datum][:size] = "5"
    end

    #Approche globale
    if params[:collected_datum][:approach] == "1"
      # SG&A sur CA
      @collected_data_1 = CollectedDatum.new(value: params[:collected_datum][:sga].to_f / params[:collected_datum][:ca_globale].to_f, numerator: params[:collected_datum][:sga].to_f, denominator: params[:collected_datum][:ca_globale].to_f, first_name: params[:collected_datum][:first_name], last_name: params[:collected_datum][:last_name], email: params[:collected_datum][:email], company: params[:collected_datum][:company], position: params[:collected_datum][:position], approach_id: params[:collected_datum][:approach], activity_id: params[:collected_datum][:activity], size_id: params[:collected_datum][:size], kpi_id: 1)
      # G&A sur CA
      @collected_data_2 = CollectedDatum.new(value: params[:collected_datum][:ga].to_f / params[:collected_datum][:ca_globale].to_f, numerator: params[:collected_datum][:ga].to_f, denominator: params[:collected_datum][:ca_globale].to_f, first_name: params[:collected_datum][:first_name], last_name: params[:collected_datum][:last_name], email: params[:collected_datum][:email], company: params[:collected_datum][:company], position: params[:collected_datum][:position], approach_id: params[:collected_datum][:approach], activity_id: params[:collected_datum][:activity], size_id: params[:collected_datum][:size], kpi_id: 2)
      # Coût Finance sur CA
      @collected_data_3 = CollectedDatum.new(value: params[:collected_datum][:finance_globale].to_f / params[:collected_datum][:ca_globale].to_f, numerator: params[:collected_datum][:finance_globale].to_f, denominator: params[:collected_datum][:ca_globale].to_f, first_name: params[:collected_datum][:first_name], last_name: params[:collected_datum][:last_name], email: params[:collected_datum][:email], company: params[:collected_datum][:company], position: params[:collected_datum][:position], approach_id: params[:collected_datum][:approach], activity_id: params[:collected_datum][:activity], size_id: params[:collected_datum][:size], kpi_id: 3)
      # Dépenses IT sur CA
      @collected_data_4 = CollectedDatum.new(value: params[:collected_datum][:people].to_f / params[:collected_datum][:rh].to_f, numerator: params[:collected_datum][:people].to_f, denominator: params[:collected_datum][:rh].to_f, first_name: params[:collected_datum][:first_name], last_name: params[:collected_datum][:last_name], email: params[:collected_datum][:email], company: params[:collected_datum][:company], position: params[:collected_datum][:position], approach_id: params[:collected_datum][:approach], activity_id: params[:collected_datum][:activity], size_id: params[:collected_datum][:size], kpi_id: 4)
      # Salariés gérés par ETP RH
      @collected_data_5 = CollectedDatum.new(value: params[:collected_datum][:it].to_f / params[:collected_datum][:ca_globale].to_f, numerator: params[:collected_datum][:it].to_f, denominator: params[:collected_datum][:ca_globale].to_f, first_name: params[:collected_datum][:first_name], last_name: params[:collected_datum][:last_name], email: params[:collected_datum][:email], company: params[:collected_datum][:company], position: params[:collected_datum][:position], approach_id: params[:collected_datum][:approach], activity_id: params[:collected_datum][:activity], size_id: params[:collected_datum][:size], kpi_id: 5)
      # Selling & Marketing cost sur CA
      @collected_data_6 = CollectedDatum.new(value: params[:collected_datum][:sm].to_f / params[:collected_datum][:ca_globale].to_f, numerator: params[:collected_datum][:sm].to_f, denominator: params[:collected_datum][:ca_globale].to_f, first_name: params[:collected_datum][:first_name], last_name: params[:collected_datum][:last_name], email: params[:collected_datum][:email], company: params[:collected_datum][:company], position: params[:collected_datum][:position], approach_id: params[:collected_datum][:approach], activity_id: params[:collected_datum][:activity], size_id: params[:collected_datum][:size], kpi_id: 6)
      # Coût Marketing sur CA
      @collected_data_7 = CollectedDatum.new(value: params[:collected_datum][:marketing].to_f / params[:collected_datum][:ca_globale].to_f, numerator: params[:collected_datum][:marketing].to_f, denominator: params[:collected_datum][:ca_globale].to_f, first_name: params[:collected_datum][:first_name], last_name: params[:collected_datum][:last_name], email: params[:collected_datum][:email], company: params[:collected_datum][:company], position: params[:collected_datum][:position], approach_id: params[:collected_datum][:approach], activity_id: params[:collected_datum][:activity], size_id: params[:collected_datum][:size], kpi_id: 7)
          
      if @collected_data_1.save && @collected_data_2.save && @collected_data_3.save && @collected_data_4.save && @collected_data_5.save && @collected_data_6.save && @collected_data_7.save # save collected data in the db        
        # Table with collected data - preparation for csv export
        @csv_array << ["Libellé", "Collecte - Valeur", "Collecte - Numérateur", "Collecte - Dénominateur", "Benchmark - Valeur médiane", "Benchmark - Valeur min", "Benchmark - Valeur max"]
        @csv_array << [@collected_data_1.kpi.label, @collected_data_1.value, @collected_data_1.numerator, @collected_data_1.denominator]
        @csv_array << [@collected_data_2.kpi.label, @collected_data_2.value, @collected_data_2.numerator, @collected_data_2.denominator]
        @csv_array << [@collected_data_3.kpi.label, @collected_data_3.value, @collected_data_3.numerator, @collected_data_3.denominator]
        @csv_array << [@collected_data_4.kpi.label, @collected_data_4.value, @collected_data_4.numerator, @collected_data_4.denominator]
        @csv_array << [@collected_data_5.kpi.label, @collected_data_5.value, @collected_data_5.numerator, @collected_data_5.denominator]
        @csv_array << [@collected_data_6.kpi.label, @collected_data_6.value, @collected_data_6.numerator, @collected_data_6.denominator]
        @csv_array << [@collected_data_7.kpi.label, @collected_data_7.value, @collected_data_7.numerator, @collected_data_7.denominator]

        # Table with benchmark - preparation for csv export
        @csv_array.each_with_index do |csv_array_row, index|
          Bench.all.each do |bench|   
            if bench.kpi.label == csv_array_row[0] && bench.approach_id == params[:collected_datum][:approach].to_i && bench.activity_id == params[:collected_datum][:activity].to_i && bench.size_id == params[:collected_datum][:size].to_i
              @csv_array[index][4] = bench.median_value
              @csv_array[index][5] = bench.min_value
              @csv_array[index][6] = bench.max_value
            end
          end  
        end

        #CSV generation for export
        config = {
          col_sep: ';',
          encoding: 'ISO-8859-1'
        }
        @csv_export = CSV.generate(config) do |csv|
          @csv_array.each do |csv_array_row| 
              csv << csv_array_row
            end
          end

        AdminMailer.send_csv_attachment(@collected_data_1, @csv_export).deliver_now
        redirect_to root_path
        flash[:success] = "Votre demande de benchmark a bien été prise en compte"
      else
        redirect_to root_path
        flash[:error] = "Erreur dans la saisie des données"
      end
    #Approche par fonction - Finance
    elsif params[:collected_datum][:approach] == "2"
    #Approche par fonction - RH  
    elsif params[:collected_datum][:approach] == "3"
    #Approche par fonction - IT
    elsif params[:collected_datum][:approach] == "4"
    #Approche par fonction - Marketing & Ventes  
    elsif params[:collected_datum][:approach] == "5"    
    end
  end
end
