class AddJacketIdToCds < ActiveRecord::Migration[5.2]
  def change
    add_column :cds, :jacket_id, :text
  end
end
