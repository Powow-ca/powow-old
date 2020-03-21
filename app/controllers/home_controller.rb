class HomeController < ApplicationController
  def index
    @professionals = Professional.all
  end
end
