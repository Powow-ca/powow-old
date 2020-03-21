class AddServicesToProfessional < ActiveRecord::Migration[6.0]
  def change
    add_reference :professionals, :service, foreign_key: true
  end
end
