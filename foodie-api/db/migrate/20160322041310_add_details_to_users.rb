class AddDetailsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :auth_token, :string
  	add_column :users, :name, :string
    add_column :users, :admin, :boolean, :default => false
  end
end
