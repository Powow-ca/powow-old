# frozen_string_literal: true

class AddUsersToProfessional < ActiveRecord::Migration[6.0]
  def change
    add_reference :professionals, :user, foreign_key: true
  end
end
