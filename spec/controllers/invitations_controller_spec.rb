describe InvitationsController do

	let(:referrer) { create :user_with_session }

	describe "POST to #create" do

		context "when referral_email doesnt exist in db" do

			before { authenticated_req :post, :create, {invitation:{referral_email:"test@test.com"}}, referrer }

			it { should respond_with :ok }

			it "creates invitation" do
				expect(Invitation.count).to eq 1
			end

			it "sets referral email" do
				expect(Invitation.first.referral_email).to eq "test@test.com"
			end

			it "sets referrer" do
				expect(Invitation.first.referrer).to eq referrer
			end

		end

		context "when referral_email already has an invitation" do

			let(:existing_invitation) { create :invitation }
			
			before { authenticated_req :post, :create, {invitation:{referral_email:existing_invitation.referral_email}}, referrer }

			it { should respond_with :unprocessable_entity }
			it "doesnt create invitation" do
				expect(Invitation.count).to be 1
			end
			it "renders error" do
				expect(json_response["errors"]["referral_email"]).to include "already a user"
			end

		end

		context "when referral is already signed up" do

			let(:referral) { create :user }

			before { authenticated_req :post, :create, {invitation:{referral_email:referral.email}}, referrer }

			it { should respond_with :unprocessable_entity }
			it "doesnt create invitation" do
				expect(Invitation.count).to eq 0
			end
			it "renders error" do
				expect(json_response["errors"]["referral_email"]).to include "already a user"
			end

		end

	end

	describe "POST to #visit" do

		let(:invitation) { create :invitation }

		it "runs Visit" do
			expect(Visit).to receive(:new)
			post :visit, {id:invitation.id}
			should respond_with :no_content
		end

	end

end