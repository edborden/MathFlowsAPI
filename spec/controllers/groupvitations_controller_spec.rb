describe GroupvitationsController do

	let(:group) { create :group }
	let(:sender) { create :user_with_session }
	let(:receiver) { create :user_with_session }
	
	before { group.users << sender }

	describe "POST to #create" do

		before { authenticated_req :post, :create, {groupvitation:{receiver_email:receiver.email}}, sender }

		it { expect(Groupvitation.count).to be 1 }

		it "sets receiver_id if receiver exists" do
			expect(Groupvitation.first.receiver_id).to eq receiver.id
		end

		context "when receiver is already in group" do
			it "responds with errors"
		end

	end

	context "when a groupvitation exists" do

		let!(:groupvitation) { create :groupvitation, sender:sender,receiver:receiver,receiver_email:receiver.email }

		describe "POST to #accept" do

			it "runs Accept" do
				expect(Accept).to receive(:new).with(receiver,groupvitation).and_return double(group: create(:group))
				authenticated_req :post, :accept, {id:groupvitation.id}, receiver
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
				expect { authenticated_req :delete, :destroy, {id:groupvitation.id},sender }
					.to change {Groupvitation.count }
					.from(1)
					.to 0
			end

		end

	end

end