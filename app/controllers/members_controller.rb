class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_idea

  def create
    @member = @idea.members.new
    @member.user = current_user
    if @member.save
      redirect_to :back, notice: "Joined this idea!"
    else
      redirect_to :back, alert: "You can't join this idea."
    end
  end

  def destroy
    @member = current_user.members.find_by_id params[:id]
    if @member && @member.destroy
      redirect_to :back, notice: "You have left this idea."
    else
      redirect_to :back, alert: "You have not left this idea."
    end
  end

  private

  def find_idea
    @idea = Idea.find params[:idea_id]
  end
end
