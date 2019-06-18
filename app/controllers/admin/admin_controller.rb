class Admin::AdminController < AdminController
	def index
		if params[:extract] == "collect"
			@collected_data = CollectedDatum.all
			respond_to do |format|
				format.csv { send_data @collected_data.to_csv, filename: "#{DateTime.now.strftime("%Y%m%d")}_historiques_données.csv" }
			end
		elsif params[:extract] == "bench"
			@bench = Bench.all
			respond_to do |format|
				format.csv { send_data @bench.to_csv, filename: "#{DateTime.now.strftime("%Y%m%d")}benchmark.csv" }
			end
		end	
	end
end
