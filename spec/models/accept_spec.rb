describe Accept do

	let(:group) { create :group }
	let(:sender) { create :user, group_id: group.id }
	let(:receiver) { create :user }
	let(:groupvitation) { create :groupvitation, sender:sender,receiver:receiver,receiver_email:receiver.email }

	before { Accept.new receiver,groupvitation }

	it { expect(groupvitation.accepted?).to be true }

	it "runs Join"

	context "When receiver is already in a group" do

		it "runs Unjoin"

	end

end