class LayoutsController < ApplicationController
	include ActionController::MimeResponds

	def create
		layout = Layout.create
		render json: layout
	end

	def show
		layout = Layout.find params[:id]
		respond_to do |format|

			format.html do
				pdf = Pdf.new(layout)
				send_data pdf.render, filename: "layout_#{layout.created_at.strftime("%d/%m/%Y")}.pdf", type: "application/pdf"
			end

			#format.json do
			#	render json: layout
			#end
		end
	end

	def destroy
		layout = Layout.find params[:id]
		layout.destroy
		head :no_content
	end

end
