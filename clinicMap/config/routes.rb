Rails.application.routes.draw do

  root 'clinic#index'

  get 'clinics' => 'clinic#clinics'
  get 'geolocate' => 'clinic#geolocate'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

end
