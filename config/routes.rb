Rails.application.routes.draw do
  devise_for :users
  root 'conversations#index'
  resources :conversations, only: [:index, :show]


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end


  resources :utilisateurs, only: [:new, :create, :edit, :update, :destroy]
  resources :structures, only: [:new, :create, :edit, :update, :destroy]
end
