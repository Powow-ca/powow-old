# frozen_string_literal: true

class User < ApplicationRecord
  

  enum user_role: { admin: 'admin', client: 'client', pro: 'pro' }

  validates          :email, presence: true
  validates          :first_name, presence: true
  validates          :last_name, presence: true

  has_many :professionals
  has_many :meetings
  has_many :orders
end
