class AddTitleToCds < ActiveRecord::Migration[5.2]
  def change
    add_column :cds, :title, :string
    add_column :cds, :genre, :string
    add_column :cds, :jacket, :string
    add_column :cds, :label, :string
    add_column :cds, :artist_id, :integer
    add_column :cds, :song_id, :integer
  end
end
