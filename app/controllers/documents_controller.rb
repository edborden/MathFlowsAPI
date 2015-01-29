class DocumentsController < ApplicationController
	include ActionController::MimeResponds

	def create
		copy_from = Document.find params[:document][:copy_from_id]
		document = copy_from.amoeba_dup
		document.save
		render json: document
	end

	def show
		puts current_user.id
		puts current_user.header
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
		puts current_user.header
	end

	def destroy
		document = Document.find params[:id]
		document.destroy
		head :no_content
	end

end
