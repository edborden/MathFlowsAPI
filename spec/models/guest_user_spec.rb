require 'rails_helper'

describe GuestUser do

	context "when run" do

		before { @user = GuestUser.new.user }

		it { expect(@user).to be_valid }
		it { expect(Folder.count).to be 1 }
		it { expect(Test.count).to be 1 }
		it { expect(Page.count).to be 1 }
		it { expect(Block.count).not_to be 0 }
		
	end

end