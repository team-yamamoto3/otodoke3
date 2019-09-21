class RemoveEnduserIdFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :Enduser_id, :integer
  end
end
