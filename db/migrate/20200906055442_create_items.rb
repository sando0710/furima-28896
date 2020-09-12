class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id, null: false
      t.string :name , null: false   
      t.text :introduction, null: false
      t.integer :category_id , null: false 
      t.integer :condition_id ,null: false
      t.integer :delivery_burden_id , null: false
      t.integer :prefecture_id , null: false
      t.integer :prepare_day_id ,null: false
      t.integer :price , null: false  

      t.timestamps
    end
  end
end
