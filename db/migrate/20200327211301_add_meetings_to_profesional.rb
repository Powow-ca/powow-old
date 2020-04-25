# frozen_string_literal: true

class AddMeetingsToProfesional < ActiveRecord::Migration[6.0]
  def change
    add_reference :meetings, :professional, foreign_key: true
  end
end
