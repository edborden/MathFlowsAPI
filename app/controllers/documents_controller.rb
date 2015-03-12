class DocumentsController < ApplicationController
	include ActionController::MimeResponds

	def create
		copy_from = Document.find params[:document][:copy_from_id]
		document = copy_from.amoeba_dup
		document.name = document.name + " Copy"
		document.save
		render json: document
	end

	def show
		document = Document.find params[:id]
		respond_to do |format|

			format.pdf do
				pdf = Pdf.new document 
				send_data pdf.render, filename: "document_#{document.flow.created_at.strftime("%d/%m/%Y")}.pdf", type: "application/pdf"
			end

			format.html do
				render json: document
			end
		end
	end

	def update
		document = Document.update params[:id],document_params
		render json: document
	end

	def destroy
		document = Document.find params[:id]
		document.destroy
		head :no_content
	end

	def document_params
		params.require(:document).permit :name
	end

end
