class TestsController < ResourceController
	include ActionController::MimeResponds
	include AddHeaders

	def create
		if params[:test][:copy_from_id]
			copy_from = Test.find params[:test][:copy_from_id]
			@resource = copy_from.amoeba_dup
			@resource.save
			@resource.pages.each do |page|
				page.blocks.each do |block|
					block.user_id = current_user.id
					block.save
				end
			end
		else
			folder = Folder.find params[:test][:folder_id]
			@resource = Test.create
			page = Page.create test_id:@resource.id
			current_user.headers.each do |block| 
				block = block.amoeba_dup
				block.page_id = page.id
				block.user_id = current_user.id
				block.header = false
				block.save
			end
			folder.tests<<@resource
		end
		current_user.tests<<@resource
		@resource.reload
		render_resource
	end

	def show
		respond_to do |format|

			format.pdf do
				pdf = Pdf.new @resource 
				send_data pdf.render, filename: "#{@resource.name}.pdf", type: "application/pdf"
			end

			format.html do
				render_resource
			end
		end
	end

	def resource_params
		params.require(:test).permit :name,:open,:folder_id
	end

end
