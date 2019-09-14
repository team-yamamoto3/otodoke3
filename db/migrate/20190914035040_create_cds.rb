class CreateCds < ActiveRecord::Migration[5.2]
  def change
    create_table :cds do |t|
      t.string :sales_status, default: '販売中'
      t.integer :price
      t.decimal :consumption_tax, default: 1.08
      t.integer :stock

      t.timestamps
    end
  end
end
