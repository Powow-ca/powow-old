# frozen_string_literal: true

class Meeting < ApplicationRecord
  belongs_to :professional
  belongs_to :user
end
