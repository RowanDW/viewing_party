class PartiesController < ApplicationController
  def new
    @movie = MovieFacade.movie_show(params[:id])
    @party = Party.new(duration: @movie.runtime)
    @friends = current_user.friends
  end

  def create
    @movie = MovieFacade.movie_show(params[:movie_id])
    @friends = current_user.friends
    
    party[:host_id] = current_user.id
    # require "pry"; binding.pry
    if party[:duration].to_i > @movie.runtime
      new_party = Party.create(party)
      if new_party.save
        # add_party_guest(new_party) if params[:friend]
        redirect_to dashboard_path
        flash[:success] = "You've created a Viewing Party!"
      else
        render :new
        flash[:error] = "Please enter a valid start time, date and duration."
      end
    else
      render :new
      flash[:error] = "Party duration must be more than movie run time."
    end
  end

  #   def add_party_guest(party)
  #     Invite.create(party_id: party.id,  guest_id: id.to_i)
  #   end

  def party_params
    params.permit(:movie_id, :duration, :start_time, :day, :title)
  end
end
