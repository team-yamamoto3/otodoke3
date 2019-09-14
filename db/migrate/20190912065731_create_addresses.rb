class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :tell
      t.text :postal_code
      t.text :address

      t.timestamps
    end
  end
end
