# frozen_string_literal: true

class Service < ApplicationRecord
  enum category: {
    Legal: 'Legal',
    Grooming: 'Grooming',
    Consultation: 'Consultation',
    Coaching: 'Coaching',
    Insurance: 'Insurance',
    Tutoring: 'Tutor'
  }
  has_many :professionals
end
