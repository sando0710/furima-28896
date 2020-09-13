class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.integer :exchange_id, foreign_key:true
      t.string :post_code ,null: false
      t.integer :prefecture ,null: false
      t.string :city,null: false
      t.string :address,null: false
      t.string :building,null: false
      t.string :phone_number,null: false
      t.timestamps
    end
  end
end


