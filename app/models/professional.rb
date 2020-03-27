# frozen_string_literal: true

class Professional < ApplicationRecord
  belongs_to :service
  belongs_to :user
  has_many :meetings
end
