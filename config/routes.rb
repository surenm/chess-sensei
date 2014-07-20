Chess::Application.routes.draw do
  resources :games

  devise_for :users, controllers: { omniauth_callbacks: 'auth' }

  devise_scope :user do
    get "login", :to => "devise/sessions#new"
    get "logout",:to => "devise/sessions#destroy"
    get "signup",:to => "devise/registrations#new"
  end

  get "/me" => "application#me"

  root :to => "application#index"
end
