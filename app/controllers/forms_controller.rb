class FormsController < ApplicationController
  def index
  end
  def create
    if params[:collected_datum][:approach] == "1"
      #Approche globale
      # SG&A sur CA
      @collected_data_1 = CollectedDatum.new(value: 1.0/2.0, numerator: params[:collected_datum][:sga], denominator: params[:collected_datum][:ca_globale], first_name: params[:collected_datum][:first_name], last_name: params[:collected_datum][:last_name], email: params[:collected_datum][:email], company: params[:collected_datum][:company], position: params[:collected_datum][:position], approach_id: params[:collected_datum][:approach], activity_id: params[:collected_datum][:activity], size_id: params[:collected_datum][:size], kpi_id: 1)
      # G&A sur CA
      @collected_data_2 = CollectedDatum.new(value: params[:collected_datum][:first_name], numerator: params[:collected_datum][:ga], denominator: params[:collected_datum][:ca_globale], first_name: params[:collected_datum][:first_name], last_name: params[:collected_datum][:last_name], email: params[:collected_datum][:email], company: params[:collected_datum][:company], position: params[:collected_datum][:position], approach_id: params[:collected_datum][:approach], activity_id: params[:collected_datum][:activity], size_id: params[:collected_datum][:size], kpi_id: 2)
      # Coût Finance sur CA
      @collected_data_3 = CollectedDatum.new(value: params[:collected_datum][:first_name], numerator: params[:collected_datum][:finance_globale], denominator: params[:collected_datum][:ca_globale], first_name: params[:collected_datum][:first_name], last_name: params[:collected_datum][:last_name], email: params[:collected_datum][:email], company: params[:collected_datum][:company], position: params[:collected_datum][:position], approach_id: params[:collected_datum][:approach], activity_id: params[:collected_datum][:activity], size_id: params[:collected_datum][:size], kpi_id: 3)
      # Dépenses IT sur CA
      @collected_data_4 = CollectedDatum.new(value: params[:collected_datum][:first_name], numerator: params[:collected_datum][:people], denominator: params[:collected_datum][:rh], first_name: params[:collected_datum][:first_name], last_name: params[:collected_datum][:last_name], email: params[:collected_datum][:email], company: params[:collected_datum][:company], position: params[:collected_datum][:position], approach_id: params[:collected_datum][:approach], activity_id: params[:collected_datum][:activity], size_id: params[:collected_datum][:size], kpi_id: 4)
      # Salariés gérés par ETP RH
      @collected_data_5 = CollectedDatum.new(value: params[:collected_datum][:first_name], numerator: params[:collected_datum][:it], denominator: params[:collected_datum][:ca_globale], first_name: params[:collected_datum][:first_name], last_name: params[:collected_datum][:last_name], email: params[:collected_datum][:email], company: params[:collected_datum][:company], position: params[:collected_datum][:position], approach_id: params[:collected_datum][:approach], activity_id: params[:collected_datum][:activity], size_id: params[:collected_datum][:size], kpi_id: 5)
      # Selling & Marketing cost sur CA
      @collected_data_6 = CollectedDatum.new(value: params[:collected_datum][:first_name], numerator: params[:collected_datum][:sm], denominator: params[:collected_datum][:ca_globale], first_name: params[:collected_datum][:first_name], last_name: params[:collected_datum][:last_name], email: params[:collected_datum][:email], company: params[:collected_datum][:company], position: params[:collected_datum][:position], approach_id: params[:collected_datum][:approach], activity_id: params[:collected_datum][:activity], size_id: params[:collected_datum][:size], kpi_id: 6)
      # Coût Marketing sur CA
      @collected_data_7 = CollectedDatum.new(value: params[:collected_datum][:first_name], numerator: params[:collected_datum][:marketing], denominator: params[:collected_datum][:ca_globale], first_name: params[:collected_datum][:first_name], last_name: params[:collected_datum][:last_name], email: params[:collected_datum][:email], company: params[:collected_datum][:company], position: params[:collected_datum][:position], approach_id: params[:collected_datum][:approach], activity_id: params[:collected_datum][:activity], size_id: params[:collected_datum][:size], kpi_id: 7)
      if @collected_data_1.save! && @collected_data_2.save! && @collected_data_3.save! && @collected_data_4.save! && @collected_data_5.save! && @collected_data_6.save! && @collected_data_7.save! # save collected data in the db
        redirect_to root_path
      else
        redirect_to root_path
      end
    elsif params[:collected_datum][:approach] == 2
      #Approche par fonction - Finance
    elsif params[:collected_datum][:approach] == 3
      #Approche par fonction - RH
    elsif params[:collected_datum][:approach] == 4
      #Approche par fonction - IT
    elsif params[:collected_datum][:approach] == 5
      #Approche par fonction - Marketing & Ventes
    end
  end
end
