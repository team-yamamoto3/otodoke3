class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.string :order_status, default: '準備中'
      t.text :payment, default: '代引き'
      t.integer :postage, default: 500
      t.integer :sum_price
      t.integer :user_id
      t.integer :order_id

      t.timestamps
    end
  end
end
