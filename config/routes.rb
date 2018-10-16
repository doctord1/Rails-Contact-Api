Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #~ get '/', to: 'contacts#index', as: :home
  root to: 'users#new'
  scope 'api' do


  #contacts
  get '/contact/new', to: 'contacts#new', as: :new_contact_form
  post '/contact', to: 'contacts#create', as: :create_new_contact
  get '/contact', to: 'contacts#index', as: :show_all_user_contacts
  get '/contact/:id', to: 'contacts#show', as: :show_single_contact
  get '/contact/show_starred/:user', to: 'contacts#starred', as: :show_starred_contacts
  get '/contact/:id/edit', to: 'contacts#edit', as: :edit_contact_form
  patch '/contact/:id', to: 'contacts#update', as: :update_single_contact
  delete '/contact/:id', to: 'contacts#destroy', as: :delete_single_contact
  patch '/contact/:id/star', to: 'contacts#star', as: :star_single_contact


  #users
  get '/user/signup', to: 'users#new', as: :signup_form
  post '/user/signin', to: 'users#authenticate', as: :authenticate
  post '/user/signup', to: 'users#create', as: :do_signup
  get '/user/signin', to: 'users#signin', as: :login
  get '/user/logout', to: 'users#logout', as: :logout
  get '/users', to: 'users#index', as: :all_users
  get '/user/me', to: 'users#me', as: :my_profile
  get '/user/:id', to: 'users#show', as: :show_single_user
  patch '/user/:id', to: 'users#update', as: :update_single_user
  delete '/user/:id', to: 'users#destroy', as: :delete_single_user

  end
end
