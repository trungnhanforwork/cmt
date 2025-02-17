class CreateSubgroups < ActiveRecord::Migration[8.0]
  def change
    create_table :subgroups do |t|
      t.string :name
      t.string :code, null: false
      t.string :description
      t.timestamps
    end
    add_index :subgroups, :code, unique: true
    rename_column :cert_types, :name, :code
    add_column :cert_types, :name, :string
  end
end
