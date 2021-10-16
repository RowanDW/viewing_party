class PartiesController < ApplicationController
  def new
    @movie = MovieFacade.movie_show(params[:id])
    @party = Party.new(duration: @movie.runtime)
  end

  def create
    @movie = MovieFacade.movie_show(party_params[:movie])
    party = Party.new(party_params)

    if party_params[:duration].to_i < @movie.runtime
      flash[:warning] = "Error: invalid party - duration must be at least #{@movie.runtime} minutes"
      redirect_to "/parties/new?id=#{party_params[:movie]}"
    elsif party.save
      if params[:friends]
        params[:friends].each do |id, invite|
          Invite.create(party_id: party.id, guest_id: id.to_i) if invite == '1'
        end
      end
      flash[:success] = "Party successfully created!"
      redirect_to dashboard_path
    else
      flash[:warning] = 'Error: invalid party'
      redirect_to "/parties/new?id=#{party_params[:movie]}"
    end
  end

private

  def party_params
    params.require(:party).permit(:movie, :duration, :day, :start_time, :host_id)
  end
end
