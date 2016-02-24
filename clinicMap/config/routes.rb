Rails.application.routes.draw do

  root 'clinic#index'

  get 'clinics' => 'clinic#clinics'
  get 'geolocate' => 'clinic#geolocate'

end
