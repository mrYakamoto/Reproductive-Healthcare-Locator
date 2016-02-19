include ScraperHelper


class ClinicController < ApplicationController

  def index
    @cpcs = Clinic.all
    if request.xhr?
      render :json => @cpcs
    end
  end

end
