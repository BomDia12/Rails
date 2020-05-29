Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'application#homepage'

  resources :songs, :albums, :musical_genders, :musicians
end
