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
					block.test_id = @resource.id
					block.save
				end
			end
		else
			folder = Folder.find params[:test][:folder_id]
			@resource = Waterfall.new.test(MasterMold.new.fresh_test)
			folder.tests<<@resource
			AddHeaders::to_this @resource.pages.first
			@resource.reload
		end
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
