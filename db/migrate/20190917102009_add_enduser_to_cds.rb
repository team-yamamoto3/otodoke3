class AddEnduserToCds < ActiveRecord::Migration[5.2]
  def change
    add_column :cds, :enduser, :string
  end
end
