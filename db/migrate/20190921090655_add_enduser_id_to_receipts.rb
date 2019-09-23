class AddEnduserIdToReceipts < ActiveRecord::Migration[5.2]
  def change
    add_column :receipts, :enduser_id, :integer
  end
end
