class AdminController < ApplicationController
	def index
		if params[:extract] == "collect"
			@collected_data = CollectedDatum.all
			respond_to do |format|
				format.csv { send_data @collected_data.to_csv, filename: "#{DateTime.now.strftime("%Y%m%d")}_historiques_données.csv" }
			end
		elsif params[:extract] == "bench"
			@bench = Bench.all
			respond_to do |format|
				format.csv { send_data @bench.to_csv, filename: "#{DateTime.now.strftime("%Y%m%d")}_benchmark.csv" }
			end
		end	
	end

  def create
		Bench.import(params[:bench][:file])
		flash[:notice] = "Benchmark successfully updated"
		redirect_to admin_index_path
	end
end