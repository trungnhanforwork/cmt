class CreateCertificates < ActiveRecord::Migration[8.0]
  def change
    create_table :certificates do |t|
      t.string :cert_number, null: false
      t.date :cert_date, null: false
      t.jsonb :products, default: []
      t.references :cert_type, foreign_key: true
      t.references :brand, foreign_key: true, null: false

      t.timestamps
    end
    create_table :certificate_subgroups do |t|
      t.references :certificate, foreign_key: true, null: false
      t.references :subgroup, foreign_key: true, null: false

      t.timestamps
    end
  end
end
