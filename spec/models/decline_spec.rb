describe Decline do

  let(:group) { create :group }
  let(:sender) { create :user_with_session }
  let(:receiver) { create :user_with_session }
  let(:groupvitation) { create :groupvitation, sender:sender,receiver:receiver,receiver_email:receiver.email }

  before do 
    group.users << sender
    Decline.new groupvitation
  end   

  it { expect(groupvitation.reload.declined?).to be true }
  it { expect(receiver.groupvitations.count).to be 0 }  

end