class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :user_id, :size => 11
      t.text :address
      t.boolean :starred, :default => false
      t.timestamps
    end
  end
end
