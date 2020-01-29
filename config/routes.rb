Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  resources :relationships, only: [:create, :destroy]
  resources :tweets, only: [:create, :index]

  get :user_profile, to: "relationships#user_profile"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
