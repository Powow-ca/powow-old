class AddLinkedInTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :linkedin_token, :string
  end
end
