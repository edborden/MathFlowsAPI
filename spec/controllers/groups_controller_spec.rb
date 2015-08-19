describe GroupsController do

	let(:user) { create :user_with_session }

	describe "POST to #create" do

		it "returns group which contains current user" do
			authenticated_req :post, :create, {group:{name:"Test Group"}}, user
			expect(json_response["users"][0]["id"]).to eq user.id
		end

	end

	describe "POST to #unjoin" do	

		it "runs Unjoin" do
			expect(Unjoin).to receive(:new).with user
			authenticated_req :post, :unjoin, nil, user
			should respond_with 204
		end

	end

	describe "PUT to #update" do

		let(:group) { create :group }

		context "from user in group" do

			before { group.users << user }

			it "updates group" do
				authenticated_req :put, :update, {id:group.id,group:{name:"Test Name"}},user
				expect(json_response["group"]["name"]).to eq "Test Name"
			end

		end

		context "from user not in group" do

			before { authenticated_req :put, :update, {id:group.id,group:{name:"Test Name"}},user }
			it { should respond_with 403 }

		end

	end
	
end