class AddLastNameKanaToEndusers < ActiveRecord::Migration[5.2]
  def change
    add_column :endusers, :last_name_kana, :string
    add_column :endusers, :first_name_kana, :string
  end
end
