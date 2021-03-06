class UpdateUniqueConstraintOnUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, [:email, :role,], :unique => true
    remove_index :users, name: :index_users_on_email
  end
end
