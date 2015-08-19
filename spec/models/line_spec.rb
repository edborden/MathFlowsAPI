require 'rails_helper'

describe Line do

	describe "db" do

		it { should have_db_column(:block_id).of_type(:integer).with_options null:false }
		it { should have_db_column(:content).of_type(:text).with_options default:"",null:false }
		it { should have_db_column(:position).of_type(:float).with_options default:1.0,null:false }

		it { should have_db_index :block_id }

	end

	describe "associations" do

		it { should belong_to :block }

	end

end