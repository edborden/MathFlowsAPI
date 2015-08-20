describe TestsController do

	include_context "eager_user_with_block"

	describe "POST to #create" do

		before do
			create :header,user:user
			authenticated_req :post, :create, {test:{folder_id: folder.id}}, user
		end

		it { should respond_with :ok }

		it "creates a test" do
			expect(Test.count).to eq 2
		end

		it "puts the test in the folder" do
			expect(folder.reload.tests.count).to eq 2
		end

		it "gives it a page" do
			expect(Page.count).to eq 2
			expect(Test.last.pages.first).to be_truthy
		end


		it "gives it a block" do
			expect(Test.last.pages.first.blocks.first).to be_truthy
		end

		it "sets the block to type:directions" do
			expect(Test.last.pages.first.blocks.first).to be_directions		
		end


	end

	describe "GET to #show" do

	end

	describe "PUT to #update" do

	end

	describe "DELETE to #destroy" do

	end

end