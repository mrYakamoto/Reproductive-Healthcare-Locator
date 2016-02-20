Rails.application.routes.draw do

  root 'clinic#index'

  get 'clinics' => 'clinic#clinics'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

end
