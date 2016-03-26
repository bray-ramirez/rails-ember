Rails.application.routes.draw do

  devise_for :users, :only => []

  # match '*all', :to => 'base#preflight', :via => [:options]


  scope '/api', :defaults => {:format => 'json'} do

    post '/login', :to => 'sessions#create'

    resources :activities, :only => [:index]

    resources :blogs, :only => [:index, :show, :create, :update, :destroy]
    resources :recipes, :only => [:index, :show, :create, :update, :destroy]
    resources :reviews, :only => [:index, :show, :create, :update, :destroy]

    resources :users, :only => [:create]


    namespace :admin do
      resources :users, :only => [:index, :create, :destroy]
    end

  end

end
