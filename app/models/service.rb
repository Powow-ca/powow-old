# frozen_string_literal: true

class Service < ApplicationRecord
  enum category: {
    Consultation: 'Consultation',
    Coaching: 'Coaching',
    Tutoring: 'Tutor',
    Music: 'Music',
    Cooking: 'Cooking and Baking',
    Languages: 'Foreign Languages'
  }
  has_many :professionals
end
