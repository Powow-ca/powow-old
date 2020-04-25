# frozen_string_literal: true

class AddColumnToProfessional < ActiveRecord::Migration[6.0]
  def change
    add_column :professionals, :stripe_state, :string
  end
end
