describe TestCopy do

  include_context "eager_user_with_block"

  context "when user doesn't own test" do
    
    before do
      @other_user = create :user
      @copy = TestCopy.new test,@other_user
    end

    it "creates a new test" do
      test = @copy.test
      expect(@copy.test.is_a? Test).to be_truthy
      expect(@copy.test.errors.empty?).to be_truthy
    end

    it "saves test" do
      expect(Test.count).to eq 2
    end

    it "creates copied test and sets to current_user" do
      expect(@other_user.tests.first).to eq Test.last
    end

    it "copies content" do
      expect(@other_user.tests.first.pages.count).to eq test.pages.count
      expect(@other_user.blocks.count).to eq user.blocks.count
    end

    it "has no folder" do
      expect(Test.last.folder.blank?).to be_truthy
    end

  end

end