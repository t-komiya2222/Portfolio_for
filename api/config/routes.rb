Rails.application.routes.draw do
  root to: 'static_pages#home'
  get      'signup', to: 'users#new'
  get      'edit'  , to: 'users#edit'
  get      'login' , to: 'sessions#new'
  post     'login' , to: 'sessions#create'
  delete   'logout', to: 'sessions#destroy'
  get      '/follow/:id', to: 'users#follow'
  get      '/follower/:id', to: 'users#follower'
  get      'search' => 'portfolios#search'
  get     'sort', to:'portfolios#sort'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :portfolios do
    resources :comments, only: [:create]
    
    post 'like' => 'likes#create'
    delete 'dislike' => 'likes#destroy'

    collection do
      get 'confirm'
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :comments, only: :destroy
end
