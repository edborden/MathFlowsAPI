class AddGroupHelpToPreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :group_help, :boolean, null:false, default: true
  end
end
