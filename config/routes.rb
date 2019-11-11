Rails.application.routes.draw do
  resources :recipes
  resources :ingredients
  resources :monsters

  # routes to home controller
  root to: 'home#transition', as: "home-transition"
  get 'home', to: 'home#menu', as: "home-menu"

  # routes to static controller
  get 'about', to: 'static#about', as: "about"
  get 'instructions', to: 'static#instructions', as: "instructions"

  #routes to play controller
  get 'play', to: 'play#transition', as: "play-transition"
  get '/play/choose-chef', to: 'play#choose_chef', as: "chef-selection"
  get 'play/edit-chef', to: 'play#edit_chef', as: "chef-edit"
  get 'play/create-chef', to: 'play#edit_chef', as: "chef-create"
  get '/play/pick-ingredients', to: 'play#pick_ingredients', as: "ingredient_selection"
  get '/play/result', to: 'play#result', as: "result"
  get '/play/lose', to: 'play#lose', as: "lose"
  get '/play/win', to: 'play#win', as: "win"

end
