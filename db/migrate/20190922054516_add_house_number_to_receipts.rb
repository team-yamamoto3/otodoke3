class AddHouseNumberToReceipts < ActiveRecord::Migration[5.2]
  def change
    add_column :receipts, :house_number, :string
    add_column :receipts, :house, :text
    add_column :receipts, :phone, :string
  end
end
