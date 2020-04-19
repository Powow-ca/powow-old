class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :stripe_plan_name

      t.timestamps

      t.references :professional, foreign_key: true, index: true
    end
  end
end
