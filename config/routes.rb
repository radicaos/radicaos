Radicaos::Application.routes.draw do
  resources :downloads

  resources :comments do
    get 'more', on: :collection
    get 'wordpress', on: :collection
  end

  get '/about' => 'home#index', as: :about
  get '/lyrics' => 'home#index', as: :lyrics
  get '/tour' => 'home#index', as: :tour
  get '/contact' => 'home#index', as: :contact

  root to: 'home#index'
end
