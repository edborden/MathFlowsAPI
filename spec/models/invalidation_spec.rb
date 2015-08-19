require 'rails_helper'

describe Invalidation do

	describe "db" do

		it { should have_db_column(:block_id).of_type(:integer).with_options null:false }
		it { should have_db_column(:message).of_type(:integer).with_options null:false }

		it { should have_db_index :block_id }

		it { should define_enum_for(:message).with [:content,:position] }

	end

	describe "associations" do

		it { should belong_to :block }

	end

	describe "validations" do

		it { should validate_presence_of :block_id }
		it { should validate_presence_of :message }

	end

end