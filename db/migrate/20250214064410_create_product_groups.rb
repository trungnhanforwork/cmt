class CreateProductGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :product_groups do |t|
      t.string :name
      t.string :description
      t.string :code, null: false
      t.references :subgroup, null: false, foreign_key: true
      t.timestamps
    end
  end
end
