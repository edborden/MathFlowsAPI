class AddKickstarterReferrerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :kickstarter_referrer, :string
  end
end
