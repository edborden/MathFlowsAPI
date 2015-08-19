require 'rails_helper'

describe Visit do

	let(:user) { create :user }
	let(:invitation) { create :invitation }
	before { Visit.new invitation }
	it { expect(invitation.visited?).to be true }

end