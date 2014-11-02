class IdeasController < ApplicationController
  before_action :find_idea, only: [:show, :update, :edit, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @ideas = Idea.all
    @idea = Idea.new
  end

  def show
    @comment = Comment.new
    @member = @idea.members.find_by_user_id current_user if user_signed_in?
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea      = Idea.new idea_params
    @idea.user = current_user
    if @idea.save
      # flash[:notice] = "Idea saved successfully!"
      # redirect_to idea_path(@idea)
      redirect_to @idea, notice: "Idea saved successfully!"
    else
      flash.now[:alert] = "Please correct errors below"
      render :new
    end
  end

  def destroy
    if @idea.destroy
      redirect_to root_path, notice: "Idea deleted"
    else 
      redirect_to root_path, alert: "Idea not deleted"
    end
  end


  private

  def find_idea
    @idea = Idea.find params[:id]
  end

  def idea_params
    params.require(:idea).permit(:title, :description, :picture)
  end


end