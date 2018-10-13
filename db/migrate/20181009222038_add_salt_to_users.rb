class AddSaltToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :password, :encrypted_password
    add_column :users, :salt, :string, :limit => 40
  end
end
