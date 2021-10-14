class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(email: friendship_params[:email].downcase)
    if friend
      new_friendship = Friendship.new(user_id: current_user.id, friend_id: friend.id)
      flash[:success] = "#{friend.name} successfully added!" if new_friendship.save
    else
      flash[:warning] = 'Error: invalid email'
    end
    redirect_to dashboard_path
  end

  def friendship_params
    params.require(:friendship).permit(:email)
  end
end
