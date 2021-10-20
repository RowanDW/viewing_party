class PartiesController < ApplicationController
  def new
    @movie = MovieFacade.movie_show(params[:id])
    @party = Party.new
    @friends = current_user.friends
  end

  def create
    @movie = MovieFacade.movie_show(party_params[:movie])
    # require "pry"; binding.pry
    if party_params[:duration].to_i >= @movie.runtime
      new_party = Party.new(party_params)
      # require "pry"; binding.pry

      if new_party.save
        if params[:friend_add]
          params[:friend_add].each do |friend, invite|
            if invite == "1"
              Invite.create!(party_id: new_party.id, guest_id: friend.to_i)
            end
          end
        end
        redirect_to dashboard_path
        flash[:success] = "You've created a Viewing Party!"
      else
        redirect_to "/parties/new?id=#{party_params[:movie]}"
        flash[:error] = "You must enter a valid start time, date and duration."
      end
    else
      redirect_to "/parties/new?id=#{party_params[:movie]}"
      flash[:error] = "Party duration cannot be less than movie run time."
    end
  end

  #   def add_party_guest(party)
  #     Invite.create(party_id: party.id,  guest_id: id.to_i)
  #   end

  def party_params
    params.require(:party).permit(:host_id, :duration, :start_time, :day, :movie)
  end
end
