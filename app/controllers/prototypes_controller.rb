class PrototypesController < ApplicationController
  def index
  end

  def new
    @protype = Prototype.new
  end

  def create
    Prototype.create(prototype_params)
    redirect_to '/'
  end

  private
  def prototype_params
    params.require(:protype).permit(:title, :catch_copy, :concept, :user)
  end


end
