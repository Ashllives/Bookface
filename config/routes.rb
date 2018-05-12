Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' } 
  root to: redirect('/posts')
  get 'posts', to: 'posts#index'
  post 'posts', to: 'posts#create'
  delete 'posts/:id(.:format)', to: 'posts#destroy', as: :delete_post

  get 'comments', to: 'comment#index'
  post 'comments', to: 'comment#create'
  delete 'comments/:id(.:format)', to: 'comment#destroy', as: :delete_comment
  resources :users do
    member do
      get :following, :followers
      post :befriend, :unfriend
    end
  end 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
