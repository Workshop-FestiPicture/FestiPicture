class AddEncryptionToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :salt, :string
  	rename_column :users, :password, :hashed_password
  end
end
