class CreateBrands < ActiveRecord::Migration[8.0]
  def change
    create_table :brands do |t|
      t.string :name, null: false, index: { unique: true }
      t.integer :priority, default: 1
      t.text :description
      t.timestamps
    end
  end
end
