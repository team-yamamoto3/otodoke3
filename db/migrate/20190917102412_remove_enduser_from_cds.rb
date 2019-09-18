class RemoveEnduserFromCds < ActiveRecord::Migration[5.2]
  def change
    remove_column :cds, :enduser, :string
  end
end
