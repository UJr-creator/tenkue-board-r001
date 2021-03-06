Rails.application.routes.draw do
  root to: "posts#index"
  resources :posts do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: %i[create update edit destroy]
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
