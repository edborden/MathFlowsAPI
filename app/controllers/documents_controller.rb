class DocumentsController < ApplicationController
	include ActionController::MimeResponds

	def create
		flow = Flow.find params[:document][:flow_id]
		document = flow.documents.create
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

	def destroy
		document = Document.find params[:id]
		document.destroy
		head :no_content
	end

end
