describe Group do

  describe "db" do

    it { should have_db_column(:name).of_type(:string).with_options default: "My Group", null:false }
    it { should have_db_column(:users_count).of_type(:integer).with_options default: 0, null: false }

  end

  describe "associations" do
    it { should have_many :users }
  end

  describe "validations" do

    it { should validate_presence_of :name }
    it { should validate_presence_of :users_count }

  end

  let(:group) { create :group }
  let(:user) { create :user }

  it "counts users" do
    expect { group.users<<user }.to change { group.users(true).size }.by(1)
  end

  context "when a group has users" do

    before { group.users << user }

    it { expect { group.users.delete user }.to change { Group.count }.by(-1) }

  end

end