class CreateArrivals < ActiveRecord::Migration[5.2]
  def change
    create_table :arrivals do |t|
      t.integer :arrival_new
      t.datetime :arrival_day

      t.timestamps
    end
  end
end
