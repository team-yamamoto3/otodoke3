class AddCdIdToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :cd_id, :integer
  end
end
