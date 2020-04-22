class AddOrdersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.float :price
      t.string :payment_gateway
      t.string :token
      t.string :error_message

      t.references :product, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end

  end
end
