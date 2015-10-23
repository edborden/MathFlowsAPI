class AddFacebookReferrerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_referrer, :string
    add_column :users, :google_referrer, :string
  end
end
