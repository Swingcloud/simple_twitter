Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
  	root 'dashboard#index'
	end

  resources :tweets do
    member do
      post :like
    end
  end

  resources :users do
    member do
      post :follow
      post :unfollow
    end
  end

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
