class DashboardController < ApplicationController
  def index
    @friendship = Friendship.new
  end
end
