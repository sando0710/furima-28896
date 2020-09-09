class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :name , null: false   
      t.text :introduction, null: false
      t.integer :category , null: false 
      t.integer :condition ,null: false
      t.integer :delivery_burden , null: false
      t.integer :prefecture_code , null: false
      t.integer :prepare_day ,null: false
      t.integer :price , null: false  

      t.timestamps
    end
  end
end
