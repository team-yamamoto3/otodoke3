class AddEnduserIdToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :enduser_id, :integer
  end
end
