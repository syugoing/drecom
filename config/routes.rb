Rails.application.routes.draw do

  get 'goods/create'

  get 'goods/destroy'

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
}
  root 'topics#index'
  resources :topics
  resources :missions
  resources :shares
  resources :status, only: [:update, :destroy]
  resources :todaystatus, only: [:update, :destroy]
   resources :goods, only: [:create, :destroy]



end
