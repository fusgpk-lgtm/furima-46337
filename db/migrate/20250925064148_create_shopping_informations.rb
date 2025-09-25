class CreateShoppingInformations < ActiveRecord::Migration[7.1]
  def change
    create_table :shopping_informations do |t|
      t.string :post_number, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :house_name
      t.string :phone_number, null: false
      t.references :purchase_record, null: false, foreign_key: true
      t.timestamps
    end
  end
end
