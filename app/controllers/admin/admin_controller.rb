class Admin::AdminController < AdminController
	def index
		@collected_data = CollectedDatum.all
		respond_to do |format|
			format.html
			format.csv { send_data @collected_data.to_csv }
		end
	end
end
