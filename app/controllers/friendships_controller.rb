class FriendshipsController < ApplicationController

  def create
    friend = User.find_by(email: friendship_params[:email].downcase)
    if friend
      new_friendship = Friendship.new(user_id: current_user.id, friend_id: friend.id)
    else
      new_friendship = Friendship.new
    end

    if new_friendship.save
      flash[:success] = "#{friend.name} successfully added!"
    else
      flash[:warning] = 'Error: invalid email'
    end
    
    redirect_to dashboard_path
  end

  def friendship_params
    params.require(:friendship).permit(:email)
  end
end
