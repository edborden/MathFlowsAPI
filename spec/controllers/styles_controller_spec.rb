describe StylesController do

	include_context "user_with_block"

	describe "POST to #create" do

		it "creates style" do
			authenticated_req :post,:create,{style:{line_id:line.id,effect:"bold"}},user
			should respond_with :ok
			expect(Style.count).to eq 1
		end

		context "without ownership" do

			before { authenticated_req :post,:create,{style:{line_id:line.id,effect:"bold"}}, create(:user_with_session) }
			it { should respond_with 403 }

		end

	end

	let(:style) { create :style, line:line }

	describe "DELETE to #destroy" do

		context "with ownership" do

			before { authenticated_req :delete,:destroy,{id:style.id},user }

			it { should respond_with :no_content }

			it "deletes style" do
				expect(Style.count).to eq 0
			end

		end

		context "without ownership" do

			before { authenticated_req :delete,:destroy,{id:style.id},create(:user_with_session) }

			it { should respond_with 403 }

		end

	end

end