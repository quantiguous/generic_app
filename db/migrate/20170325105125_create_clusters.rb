class CreateClusters < ActiveRecord::Migration
  def change
    create_table :clusters do |t|
      t.string :name
      t.integer :city_id

      t.timestamps null: false
    end
  end
end