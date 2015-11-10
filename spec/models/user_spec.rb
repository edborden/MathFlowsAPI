describe User do

  describe "db" do

    it { should have_db_column(:email).of_type :string }
    it { should have_db_column(:name).of_type :string }
    it { should have_db_column(:pic).of_type :string }
    it { should have_db_column(:gender).of_type :integer }
    it { should have_db_column(:created_at).of_type :datetime }
    it { should have_db_column(:group_id).of_type :integer }
    it { should have_db_column(:uservoice_token).of_type :string }
    it { should have_db_column(:tests_count).of_type(:integer).with_options default: 0, null:false }
    it { should have_db_column(:tests_quota).of_type(:integer).with_options default: 25, null:false }
    it { should have_db_column(:referred_by).of_type :string }
    it { should have_db_column(:google_referrer).of_type :string }
    it { should have_db_column(:facebook_referrer).of_type :string }
    it { should have_db_column(:kickstarter_referrer).of_type :string }
    
    it { should have_db_index(:email).unique }
    it { should have_db_index :group_id }

    it { should define_enum_for(:gender).with [:male,:female] }

  end

  describe "associations" do

    it { should have_one(:session).dependent :destroy }
    it { should have_many(:folders).dependent :destroy }
    it { should have_many :blocks }
    it { should have_many(:tests).dependent :destroy }
    it { should belong_to(:group).counter_cache }
    it { should have_one(:preference).dependent :destroy }
    it { should have_many(:invitations_sent).dependent :destroy }
    it { should have_one(:invitation).dependent :nullify }
    it { should have_many(:groupvitations_sent).dependent :destroy }
    it { should have_many(:groupvitations).conditions(status:1).dependent :destroy }
    it { should have_one(:plan).dependent :destroy }
    it { should have_one(:google_auth).dependent :destroy }

  end

  describe "validations" do

    it { should validate_uniqueness_of(:email).allow_nil.case_insensitive }

  end

  let(:user) { create :user }

  context "after create" do

    it { expect(user.preference).to be_valid }
    it { expect(user.plan).to be_valid }
    it { expect(user.create_session).to be_valid }

  end

  describe "#headers" do

    context "when user has a block" do

      let!(:user) { create :user }
      let!(:block) { create :block,user:user }

      context "when the block isnt kind:header" do

        it "doesn't get returned" do
          expect(user.headers).not_to include block
        end

      end

      context "when the block is kind:header" do

        before do
          block.header!
          block.save
        end

        it "gets returned" do
          expect(user.headers).to include block
        end

      end

    end

  end

  context "when destroyed" do

    it "destroys invitations_sent" do
      create :invitation, referrer: user
      expect { user.destroy }.to change { Invitation.count }.by(-1)
    end

    it "nullifies referral_id on invitation" do
      referrer = create :user
      invitation = create :invitation, referrer:referrer,referral_email:user.email,referral:user
      expect { user.destroy }.to change { invitation.reload.referral_id }
        .from(user.id)
        .to(nil)
    end

    it "destroys session" do
      user.create_session
      expect { user.destroy }.to change { Session.count }.by(-1)    
    end

    it "destroys tests" do
      create :test, user:user,folder:create(:folder, user:user)
      expect { user.destroy }.to change { Test.count }.by(-1)
    end

    it "nullifies user_id on blocks" do
      create :block, user:user,page:create(:page)
      expect { user.destroy }.to change { Block.first.user_id }
        .from(user.id)
        .to nil
    end

    it "destroys preference" do
      user
      expect { user.destroy }.to change { Preference.count }.by(-1)
    end

    it "destroys groupvitations_sent" do
      receiver = create :user
      create :groupvitation, sender:user,receiver:receiver,receiver_email:receiver.email
      expect { user.destroy }.to change { Groupvitation.count }.by(-1) 
    end

    it "destroys groupvitations" do
      sender = create :user
      create :groupvitation, sender:sender,receiver:user,receiver_email:user.email
      expect { user.destroy }.to change { Groupvitation.count }.by(-1)
    end 

    it "destroys headers and blocks in clipboard" do
      create :header,user:user
      create :block,user:user
      expect(user.clips.count).to eq 1
      expect(user.headers.count).to eq 1
      expect { user.destroy }.to change { Block.count }.by(-2)
    end

  end

end