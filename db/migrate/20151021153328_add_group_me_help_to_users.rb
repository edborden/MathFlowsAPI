class AddGroupMeHelpToUsers < ActiveRecord::Migration
  def change
    add_column :preferences, :me_group_help, :boolean, null: false, default: true
    add_column :preferences, :me_test_help, :boolean, null: false, default: true
    Preference.update_all me_test_help: false
  end
end
