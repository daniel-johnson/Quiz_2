class AddUserAndIdeaRefToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :user, index: true
    add_reference :comments, :idea, index: true
  end
end
