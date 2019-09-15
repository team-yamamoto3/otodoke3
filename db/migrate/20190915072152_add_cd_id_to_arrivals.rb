class AddCdIdToArrivals < ActiveRecord::Migration[5.2]
  def change
    add_column :arrivals, :cd_id, :integer
  end
end
