class RelationshipsController < ApplicationController

  # follow a user
  def create
    user = User.find_by(id: params[:followed_id])
    if current_user.present?
      relationship = current_user.follow(user)
      render json: {:status=>"success", :code=>200, :message=>"User followed successfully!", data: relationship}
    else
      render json: {:status=>"failure", :message=>"User is not present", data: relationship}
    end
  end

  # unfollow a user
  def destroy
    user = Relationship.find(params[:id]).followed
    if current_user.present?
      relationship = current_user.unfollow(user)
      render json: {:status=>"success", :code=>200, :message=>"User unfollowed successfully!", data: relationship}
    else
      render json: {:status=>"failure", :message=>"User is not present", data: relationship}
    end
  end
end
