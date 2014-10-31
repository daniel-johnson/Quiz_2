class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_idea

  def create
    @member = @idea.members.new
    @member.user = current_user
    if @member.save
      redirect_to @idea, notice: "Joined this idea!"
    else
      redirect_to @idea, alert: "You can't join this idea."
    end
  end

  def destroy
    @member = current_user.members.find_by_id params[:id]
    if @member && @member.destroy
      redirect_to @idea, notice: "You have left this idea."
    else
      redirect_to @idea, alert: "You have not left this idea."
    end
  end

  private

  def find_idea
    @idea = Idea.find params[:idea_id]
  end
end
