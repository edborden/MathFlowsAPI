require 'rails_helper'

describe Accept do

	let(:group) { create :group }
	let(:sender) { create :user, group_id: group.id }
	let(:receiver) { create :user }
	let(:groupvitation) { create :groupvitation, sender:sender,receiver:receiver,receiver_email:receiver.email }

	before { Accept.new receiver,groupvitation }

	it { expect(receiver.group).to eq group }
	it { expect(groupvitation.accepted?).to be true }

end