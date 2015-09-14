describe Line do

	describe "db" do

		it { should have_db_column(:lineable_id).of_type(:integer).with_options null:false }
		it { should have_db_column(:lineable_type).of_type(:string).with_options null:false }		
		it { should have_db_column(:content).of_type(:text).with_options default:"",null:false }
		it { should have_db_column(:position).of_type(:float).with_options default:1.0,null:false }

		it { should have_db_index [:lineable_type,:lineable_id] }

	end

	describe "associations" do

		it { should belong_to :lineable }
		it { should have_many(:styles).dependent :destroy }

	end

	#describe "validations" do
	
		#it { should validate_presence_of :lineable }  #breaks block.amoeba copy

	#end

end