describe Join do

  let(:user) { create :user }
  let(:group) { create :group }

  before { Join.new user,group }

  it { expect(user.group).to eq group }
  it { expect(group.users(true).size).to be 1 }

end