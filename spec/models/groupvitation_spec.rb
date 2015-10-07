describe Groupvitation do

  describe "db" do

    it { should have_db_column(:sender_id).of_type(:integer).with_options null:false }
    it { should have_db_column(:receiver_id).of_type(:integer) }
    it { should have_db_column(:receiver_email).of_type(:string).with_options null:false }
    it { should have_db_column(:status).of_type(:integer).with_options null:false,default:0 }
    it { should have_db_column(:created_at).of_type :datetime }
    it { should have_db_column(:updated_at).of_type :datetime }

    it { should have_db_index :sender_id }
    it { should have_db_column :receiver_id }
    it { should have_db_column :receiver_email }

    it { should define_enum_for(:status).with [:not_a_user,:sent,:accepted,:declined] }

  end

  describe "associations" do

    it { should belong_to :sender }
    it { should belong_to :receiver }
    it { should have_one :group }

  end

  describe "validations" do

    it { should validate_presence_of :sender_id }
    it { should validate_presence_of :receiver_email }
    it { should validate_presence_of :status }

  end

  context "when receiver is not signed up yet" do

    before { @groupvitation = create :groupvitation, receiver:nil }
      
    it "creates a matching invitation" do
      expect(Invitation.first).to be_truthy
    end

    it { expect(@groupvitation.status).to eq "not_a_user" }

  end

  context "receiver is a user" do

    before do
      group = create :group
      sender = create :user
      receiver = create :user
      group.users << sender
      @groupvitation = create :groupvitation, sender:sender,receiver_email:receiver.email,receiver:receiver
    end

    it { expect(@groupvitation.reload.sent?).to be true }

  end

end