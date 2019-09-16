class AddCdIdToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :cd_id, :integer
  end
end
