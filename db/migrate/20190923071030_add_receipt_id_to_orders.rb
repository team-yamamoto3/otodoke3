class AddReceiptIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :receipt_id, :integer
  end
end
