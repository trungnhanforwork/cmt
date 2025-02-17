class CreateCertTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :cert_types do |t|
      t.string :name, null: false
      t.string :description
      t.timestamps
    end

    add_index :cert_types, :name, unique: true
  end
end
