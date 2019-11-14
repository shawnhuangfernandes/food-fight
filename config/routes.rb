Rails.application.routes.draw do
  resources :recipes
  resources :ingredients
  resources :monsters
  resources :chefs

  # routes to home controller
  root to: 'home#transition', as: "home-transition"
  get 'home', to: 'home#menu', as: "home-menu"

  # routes to static controller
  get 'about', to: 'static#about', as: "about"
  get 'instructions', to: 'static#instructions', as: "instructions"
  get 'ingredients-list', to: 'static#ingredients_list', as: 'ingredients_list'

  #routes to play controller
  get 'play', to: 'play#transition', as: "play-transition"

  get '/play/choose-chef', to: 'play#choose_chef', as: "chef_selection_form"
  post '/play/choose-chef', to: 'play#chef_selected', as: "chef_selected"

  get 'play/edit-chef', to: 'play#edit_chef', as: "chef_edit_form"
  post 'play/edit-chef', to: 'play#chef_editted', as: "chef_editted"

  get 'play/create-chef', to: 'play#create_chef', as: "chef_create_form"
  post 'play/create-chef', to: 'play#chef_created', as: "chef_created"

  get '/play/pick-ingredients', to: 'play#pick_ingredients', as: "ingredients_pick_form"
  post '/play/pick-ingredients', to: 'play#ingredients_picked', as: "ingredients_picked"

  get '/play/result', to: 'play#result', as: "result"

  get '/play/lose', to: 'play#lose', as: "lose"

  get '/play/win', to: 'play#win', as: "win"

end
