CommStratTools::Application.routes.draw do
  
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users

  resources :tickets

  # match :note_path, :to => 'notes#create', :via => [:get]
  resources :notes

end