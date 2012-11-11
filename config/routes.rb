Radicaos::Application.routes.draw do
  resources :comments

  root to: 'home#index'
end
