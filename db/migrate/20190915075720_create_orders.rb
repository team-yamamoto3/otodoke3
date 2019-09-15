class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.integer :cd_id

      t.timestamps
    end
  end
end
