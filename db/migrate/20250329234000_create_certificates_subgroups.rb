class CreateCertificatesSubgroups < ActiveRecord::Migration[7.0]
  def change
    create_table :certificates_subgroups, id: false do |t|
      t.references :certificate, null: false, foreign_key: true
      t.references :subgroup, null: false, foreign_key: true
    end

    add_index :certificates_subgroups, [:certificate_id, :subgroup_id], unique: true
  end
end