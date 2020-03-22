# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @service = Service.all
  end
end
