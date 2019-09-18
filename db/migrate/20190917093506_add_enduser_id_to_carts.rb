class AddEnduserIdToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :enduser_id, :integer
  end
end
