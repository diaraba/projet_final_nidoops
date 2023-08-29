Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/accueils/dashboard', as: 'rails_admin'
  devise_for :structures, controllers: {
    registrations: 'structures/registrations', # Contrôleur de registration personnalisé pour Structure
    sessions: 'structures/sessions',   
    confirmations: 'structures/confirmations', 
    passwords: 'structures/passwords',             # Contrôleur de sessions personnalisé pour Structure
    # ... d'autres contrôleurs si nécessaire
  }



  devise_for :users, controllers: {
    registrations: 'users/registrations', # Contrôleur de registration personnalisé pour User
    sessions: 'users/sessions',
    confirmations: 'users/confirmations', 
    passwords: 'users/passwords',             # Contrôleur de sessions personnalisé pour User
    # ... d'autres contrôleurs si nécessaire
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest', as: :guest_sign_in
    post 'users/admin_guest_sign_in', to: 'users/sessions#new_admin_guest', as: :admin_guest_sign_in
  end


  devise_scope :structure do
    post 'structures/structure_sign_in', to: 'structures/sessions#new_guest', as: :structure_sign_in
  end
  
  root 'accueils#index'
  resources :conversations, only: [:index, :show]
  

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :structures do
      get 'annonces', on: :member  # Cette route agira sur la collection d'articles
      get 'avis_offres', on: :member
      get 'subscribers', on: :member
      post 'create_profile', on: :member
      resources :abonnements , only: [:create, :destroy]
  end

  resources :users do
    get 'a_la_une_for_user', on: :member
    get 'structures', on: :member

  end

  resources :annonces do
    resources :annonce_comments, only: [:create, :edit, :update, :destroy]
  end

  resources :avis_offres do
    resources :avis_offre_comments, only: [:create, :edit, :update, :destroy]
  end  
  resources :profile_structures
  resources :profile_users

  resources :activites
  resources :accueils do
    get 'dashboard'
  end  
  
  get 'accueils/a_la_une_for_others', to: 'accueils#a_la_une_for_others', as: :a_la_une_for_others

  get 'accueils/dashboard', to: 'accueils#dashboard', as: :dashboard

  #resources :utilisateurs, only: [:new, :create, :edit, :update, :destroy]
  #resources :structures, only: [:new, :create, :edit, :update, :destroy]
end
