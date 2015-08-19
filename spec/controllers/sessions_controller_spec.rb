require 'rails_helper'

describe SessionsController do

	let(:user) { create :user_with_session }

	context "AUTHENTICATED CONTROLLER" do

		describe "GET to #index" do

			context "without token" do

				before { get :index }

				it { should respond_with :unauthorized }

			end

			context "with token in params" do

				before { get :index, {token: user.session.token} }

				it { should respond_with :ok }

			end

			context "with token in header" do

				before { authenticated_req :get, :index, nil, user }

				it { should respond_with :ok }
			
			end

			context "with invalid token" do

				before { get :index, {token: "invalid"} }

				it { should respond_with :unauthorized }

			end

		end

	end

	describe "SESSIONS CONTROLLER" do

		describe "POST to #create" do

			context "with 'issue'" do

				it "creates guest user" do

					expect(GuestUser).to receive(:new).and_return double(user:create(:user))
					post :create, {session:{token:"issue"}}
					expect(User.count).to eq 1
					expect(json_response["session"]).to be_truthy

				end

			end

			context "with guest credentials" do

				it "converts user"

			end

		end

		describe "GET to #index" do

			before { get :index, {token: user.session.token} }

			it "returns user session" do

				expect(json_response["sessions"][0]["id"]).to eq user.session.id

			end

		end

		describe "DELETE to #destroy" do

			before { authenticated_req :delete,:destroy,{id:user.session.id},user }

			it { should respond_with :no_content }

		end

	end
	
end