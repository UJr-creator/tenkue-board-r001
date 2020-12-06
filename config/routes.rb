Rails.application.routes.draw do
  root to: "posts#index"
  # get "posts/index" => "posts#index"
  # get "posts/new" => "posts#new"
  # get "posts/:id" => "posts#show"
  # post "posts/create" => "posts#create"
  # get "posts/:id/edit" => "posts#edit"
  # post "posts/:id/destroy" => "posts#destroy"

  

  resources :posts,except: [:show]

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
