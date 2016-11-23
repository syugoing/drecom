Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
}
  root 'topics#index'
  resources :topics do
    resources :comments
  end
  resources :shares, only: [:index]
  resources :status, only: [:update, :destroy]
  resources :todaystatus, only: [:update, :destroy]
  resources :goods, only: [:create, :destroy]



end
