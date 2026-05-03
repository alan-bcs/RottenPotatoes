Rails.application.routes.draw do
  resources :movies
  root "movies#index"
  
  # Rota para o POST da busca do TMDb
  post '/movies/search_tmdb', to: 'movies#search_tmdb', as: 'search_tmdb'
end