class AddUservoiceTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uservoice_token, :string
  end
end
