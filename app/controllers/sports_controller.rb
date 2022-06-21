class SportsController < ApplicationController
    def index
      @sports = Sport.all
    end
    def new
      @sport = Sport.new
    end
    def create
      sport = Sport.new(sports_params)
      sport.save
      redirect_to root_path
    end
    private
    def sports_params
      params.require(:sports).permit(:sports_name, :age, :address)
  end
  end