describe Test do

	describe "db" do

		it { should have_db_column(:name).of_type(:string).with_options default:"New Test",null:false }
		it { should have_db_column(:folder_id).of_type(:integer).with_options null:false }
		it { should have_db_column(:user_id).of_type(:integer).with_options null:false }

		it { should have_db_index(:folder_id) }

	end

	describe "associations" do

		it { should have_many :pages }
		it { should belong_to :folder }
		it { should belong_to :user }
		it { should have_many :blocks }

	end

	describe "validations" do

		it { should validate_presence_of :user_id }
		it { should validate_presence_of :folder_id }
		it { should validate_presence_of :name }

	end

	context "when destroyed" do

		include_context "eager_user_with_block"

		it "destroys pages" do
			expect { test.destroy }.to change { Page.count }.by(-1)
		end

		context "with a valid question block" do # direction and invalid blocks are left for the page to delete

			it "sets blocks' user_id and page_id to null" do
				create :block_with_invalidation, page:page
				create :block, kind:"directions", page:page
				test.destroy
				expect(Block.count).to eq 1
				block.reload
				expect(block.user_id).to be nil	
				expect(block.page_id).to be nil
			end

		end

	end

end