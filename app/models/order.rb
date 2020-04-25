# frozen_string_literal: true

class Order < ApplicationRecord
  enum status: { pending: 'pending', failed: 'failed', paid: 'paid' }
  enum payment_gateway: { stripe: 'stripe' }
  belongs_to :product
  belongs_to :user

  def set_paid
    self.status = Order.statuses[:paid]
  end

  def set_failed
    self.status = Order.statuses[:failed]
  end
end
