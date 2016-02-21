include ScraperHelper


class ClinicController < ApplicationController

  def index
    # @cpcs = Clinic.all
    if request.xhr?
      # render :json => @cpcs
    end
  end

  def clinics
    unless !(request.xhr?)
      if (params[:type] == "FP")
        @clinics = Clinic.where(:clinic_type => ["FP", "PP"])
      else
        @clinics = Clinic.where(clinic_type: params[:type])
      end

      render :json => @clinics
    end
  end

  def geolocate

    unless !(request.xhr?)
      @clinics = Clinic.near(params[:location], 100)
      render :json => @clinics
    end
  end
end
