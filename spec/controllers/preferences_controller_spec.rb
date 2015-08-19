describe PreferencesController do

	let!(:user) { create :user_with_session }

	describe "PUT to #update" do

		it "updates preference" do
			expect(user.preference.id).to be_truthy
			authenticated_req :put,:update,{id:user.preference.id,preference:{borders:true}},user
			should respond_with :ok
			expect(json_response["preference"]["borders"]).to be true
		end

		context "without ownership" do

			before { authenticated_req :put,:update,{id:user.preference.id,preference:{borders:true}},create(:user_with_session) }
			it { should respond_with :forbidden }

		end

	end

end