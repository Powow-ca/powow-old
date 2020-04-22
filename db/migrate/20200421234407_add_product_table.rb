class AddProductTable < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :target_audience
      t.string :description
      t.string :summary
      t.string :label
      t.string :details

      t.timestamps

      t.references :professional, foreign_key: true, index: true
    end
  end
end