class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_index, except: [:index, :show, :new ,:destroy, :create, :edit]

  
  def index
    @prototypes = Prototype.includes(:user).order(created_at: :desc)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.image.attached? && @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end  

  def edit
    @prototype = Prototype.find(params[:id])
    if !user_signed_in?
      redirect_to new_user_session_path 
    elsif current_user != @prototype.user
      redirect_to root_path
    end
  end
  
  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
    redirect_to prototype_path
    else
       render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
  
    if user_signed_in? && current_user == prototype.user
      prototype.destroy
      redirect_to root_path
    else
      redirect_to new_user_session_path
    end
  end  

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @prototype = Prototype.find(params[:id])
    if !user_signed_in? || current_user != @prototype.user
      redirect_to root_path
    end
  end
end