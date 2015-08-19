describe Unjoin do

	let(:user1) { create :user }
	let(:user2) { create :user }
	let(:group) { create :group }

	before do
		group.users << user1
		groupvitation = create :groupvitation, sender:user1,receiver:user1,receiver_email:user2.email
	end

	it "removes user from group" do
		expect { Unjoin.new user1 }.to change {user1.reload.group }
			.from(group) 
			.to nil
	end

	#user can't have open invites to group they don't belong to
	it "destroys groupvitations_sent" do
		expect { Unjoin.new user1 }.to change { user1.groupvitations_sent.count }.by -1
	end

end