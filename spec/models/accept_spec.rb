describe Accept do

	let(:sender) { create :user_with_group }
	let(:receiver) { create :user }
	let(:groupvitation) { create :groupvitation, sender:sender,receiver:receiver,receiver_email:receiver.email }

	let!(:accept) { Accept.new receiver,groupvitation }

	it { expect(groupvitation.accepted?).to be true }

	it "runs Join"

	context "When receiver is already in a group" do

		it "runs Unjoin"

	end

	describe "#group" do
		it { expect(accept.group).to eq sender.group }
	end

end