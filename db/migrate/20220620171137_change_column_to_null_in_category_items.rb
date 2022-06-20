class ChangeColumnToNullInCategoryItems < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:category_items, :item_id, true)
    change_column_null(:category_items, :category_id, true)
  end
end
