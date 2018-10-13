class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password, :size => 40
      t.string :email
      t.timestamps
    end
  end
end
