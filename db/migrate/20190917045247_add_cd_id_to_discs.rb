class AddCdIdToDiscs < ActiveRecord::Migration[5.2]
  def change
    add_column :discs, :cd_id, :integer
  end
end
