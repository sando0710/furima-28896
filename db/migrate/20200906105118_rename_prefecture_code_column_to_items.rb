class RenamePrefectureCodeColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :prefecture_code, :prefecture_id
    rename_column :items, :prepare_day, :prepare_day_id
    rename_column :items, :delivery_burden, :delivery_burden_id
    rename_column :items, :condition, :condition_id
  end
end
