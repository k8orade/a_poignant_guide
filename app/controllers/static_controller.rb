class StaticController < ApplicationController
  def home
    @materials = Material.all
  end
end
