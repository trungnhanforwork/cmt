class DropCertificateSubgroups < ActiveRecord::Migration[8.0]
  def change
    drop_table :certificate_subgroups
    add_column :certificates, :subgroups, :jsonb, default: []
  end
end
