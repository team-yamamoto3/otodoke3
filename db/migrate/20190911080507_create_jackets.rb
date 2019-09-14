class CreateJackets < ActiveRecord::Migration[5.2]
  def change
    create_table :jackets do |t|
      t.string :cd_image

      t.timestamps
    end
  end
end
