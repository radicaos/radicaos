Radicaos::Application.routes.draw do
  resources :downloads

  resources :comments

  root to: 'home#index'
end
