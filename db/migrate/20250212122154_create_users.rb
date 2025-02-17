class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email_address, null: false
      t.string :password_digest, null: false
      t.integer :user_type, :integer, null: false, default: 0

      t.timestamps
    end
    add_index :users, :email_address, unique: true
    add_index :users, :user_type
  end
end
