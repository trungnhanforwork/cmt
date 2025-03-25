class AddProductGroupToSubgroups < ActiveRecord::Migration[8.0]
  def change
    add_reference :subgroups, :product_group, null: true, foreign_key: true

    # Gán giá trị mặc định cho các dòng hiện tại (nếu có)
    Subgroup.reset_column_information
    default_product_group = ProductGroup.first # Hoặc tạo một nhóm mặc định
    Subgroup.where(product_group_id: nil).update_all(product_group_id: default_product_group.id) if default_product_group

    # Sau khi cập nhật, đổi lại thành NOT NULL
    change_column_null :subgroups, :product_group_id, false
    remove_column :product_groups, :subgroup_id, :integers
  end
end
