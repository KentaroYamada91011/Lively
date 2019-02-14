Rails.application.routes.draw do


  # get 'likes/destroy'
  devise_for :artists, controllers: {
    registrations: 'artists/registrations',
    sessions: 'artists/sessions',
    passwords: 'artists/passwords'
  }

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users
  resources :artists do
    resources :follows ,only:[:create, :destroy]
  end
  resources :events do
    collection {get "home"}
    collection {get "menu"}
    resources :likes ,only:[:create, :destroy]
  end
  root :to => 'events#home'
  get "events/terms_of_service"=> "events#terms_of_service"
  get "events/privacy_policy"=> "events#privacy_policy"
  # get 'artist/:id' => 'artists#show'
  # delete 'events/:id' => 'events#destroy'
  # get 'events/:id/edit' => 'events#edit'
  # patch 'events/:id' => 'events#update'
  # get 'events/:id' => 'events#show'

  # post "events/:event_id/likes/create" => "likes#create"
  # delete 'likes/:event_id' => 'likes#destroy'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
