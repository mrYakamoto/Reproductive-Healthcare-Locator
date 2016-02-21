require 'rest-client'

class Clinic < ActiveRecord::Base
  geocoded_by :address, :latitude  => :lat, :longitude => :lng


# sets lat and lng values for clinic objects in db
# use array of clinic objects where lat/lng are nil as argument
def self.set_lat_lng(clinic_array)
  clinic_array.each do |clinic|
    if ((clinic.lat == nil) || (clinic.lng ==nil))
      full_address = clinic.full_address.split(/[\W]/).join('+')
      response = RestClient.get "https://maps.googleapis.com/maps/api/geocode/json?address=#{full_address}&key=#{ENV["GOOGLE_API"]}"
      parsed_response = JSON.parse(response)
      if (parsed_response["status"] != "ZERO_RESULTS")
        clinic.lat = parsed_response["results"][0]["geometry"]["location"]["lat"]
        clinic.lng = parsed_response["results"][0]["geometry"]["location"]["lng"]
        clinic.save
      end
    end
  end
end


end
