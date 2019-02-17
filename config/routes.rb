Rails.application.routes.draw do

  root :to => 'events#home'

  devise_for :artists, controllers: {
    # registrations: 'artists/registrations',
    # sessions: 'artists/sessions',
    # passwords: 'artists/passwords'
  }
  get '/auth/another/twitter/callback' => 'anothers#twitter'
  devise_for :users, controllers: {
    # registrations: 'users/registrations',
    # sessions: 'users/sessions',
    # passwords: 'users/passwords',
  }
  get "/auth/twitter/callback" => "omniauth_callbacks#twitter"
  resources :users
  resources :artists do
    resources :follows ,only:[:create, :destroy]
  end
  resources :events do
    collection {get "home"}
    collection {get "menu"}
    resources :likes ,only:[:create, :destroy]
  end
  get "events/terms_of_service"=> "events#terms_of_service"
  get "events/privacy_policy"=> "events#privacy_policy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
