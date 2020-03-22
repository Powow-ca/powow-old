# frozen_string_literal: true

class Service < ApplicationRecord
  enum category: {
    Legal: "Legal",
    Grooming: "Grooming"
  }
  has_many :professionals
end
