class DocumentsController < ResourceController
	include ActionController::MimeResponds

	def create
		copy_from = Document.find params[:document][:copy_from_id]
		document = copy_from.amoeba_dup
		document.name = document.name + " Copy"
		document.save
		render json: document
	end

	def show
		respond_to do |format|

			format.pdf do
				pdf = Pdf.new @resource 
				send_data pdf.render, filename: "document_#{@resource.flow.created_at.strftime("%d/%m/%Y")}.pdf", type: "application/pdf"
			end

			format.html do
				render_resource
			end
		end
	end

	def resource_params
		params.require(:document).permit :name
	end

end
