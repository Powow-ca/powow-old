class AddStripeUserIdToProfessional < ActiveRecord::Migration[6.0]
  def change
    add_column :professionals, :stripe_user_id, :string
    add_column :professionals, :linkedin_link, :string
  end
end
