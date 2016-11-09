Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
}
  root 'topics#index'
  resources :topics
  resources :missions
  resources :status, only: [:update, :destroy]
  resources :todaystatus, only: [:update, :destroy]



end
