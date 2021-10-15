class PartiesController < ApplicationController
  def new
    @party = Party.new(duration: params[:duration])
    @movie = MovieFacade.movie_show(params[:id])
  end

  def create
    party = Party.new(party_params)
    if party.save
      flash[:success] = "Party successfully created!"
      redirect_to dashboard_path
    else
      flash[:warning] = 'Error: invalid party'
      redirect_to new_party_path
    end
  end

private

  def party_params
    params.require(:party).permit(:movie, :duration, :day, :start_time)
  end

  def invite_params
    params.require(:party).permit(:friends)
  end
end
