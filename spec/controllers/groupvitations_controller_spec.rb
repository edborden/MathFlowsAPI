describe GroupvitationsController do

	let(:group) { create :group }
	let(:sender) { create :user_with_session,group_id:group.id }
	let(:dummy_email) { "test@test.com" }

	describe "POST to #create" do

		context "when receiver is a user" do
			let(:receiver) { create :user_with_session }

			context "and receiver is not already in same group" do
				before { authenticated_req :post, :create, {groupvitation:{receiver_email:receiver.email}}, sender }

				it { should respond_with :ok }

				it "should create a groupvitation" do
					expect(Groupvitation.count).to be 1
				end

				it "sets receiver_id" do
					expect(Groupvitation.first.receiver_id).to eq receiver.id
				end

				it { expect(json_response["groupvitation"]["status"]).to eq "sent" }
			end

			context "and receiver is already in same group" do
				before do
					group.users << receiver
					authenticated_req :post, :create, {groupvitation:{receiver_email:receiver.email}}, sender
				end

				it { should respond_with :unprocessable_entity }
				
				it "should respond with correct error message" do
					expect(json_response["errors"]["receiver_email"]).to eq ["already in group"]
				end
			end

		end

	end

	context "when a groupvitation exists" do

		let(:receiver) { create :user_with_session }
		let(:groupvitation) { create :groupvitation, receiver:receiver }

		describe "POST to #accept" do

			it "runs Accept" do
				expect(Accept).to receive(:new).with(receiver,groupvitation).and_return double(group: create(:group))
				authenticated_req :post, :accept, {id:groupvitation.id}, receiver
				expect(json_response["group"]).to be_truthy
			end

		end

		describe "POST to #decline" do

			it "runs Decline" do
				expect(Decline).to receive(:new).with groupvitation
				authenticated_req :post, :decline, {id:groupvitation.id}, receiver
			end

		end

		describe "DELETE to #destroy" do
			
			it "deletes groupvitation" do
				groupvitation
				expect { authenticated_req :delete, :destroy, {id:groupvitation.id},receiver }
					.to change {Groupvitation.count }
					.from(1)
					.to 0
			end

		end

	end

end