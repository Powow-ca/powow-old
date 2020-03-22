# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @professionals = Professional.all
  end
end
