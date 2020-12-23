Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'login', to: 'auth#create', as: '/login'
  get 'myuser', to: 'auth#show', as: '/myuser'
  resources :user, only: [:create, :show]
  resources :image, only: [:index, :create, :show, :delete, :update]
end
