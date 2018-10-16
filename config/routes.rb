Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    #contacts
    get '/api/contact/new', to: 'contacts#new', as: :new_contact_form
    post '/api/contact', to: 'contacts#create', as: :create_new_contact
    get '/api/contact', to: 'contacts#index', as: :show_all_user_contacts
    get '/api/contact/:id', to: 'contacts#show', as: :show_single_contact
    get '/api/contact/show_starred/:user', to: 'contacts#starred', as: :show_starred_contacts
    get '/api/contact/:id/edit', to: 'contacts#edit', as: :edit_contact_form
    patch '/api/contact/:id', to: 'contacts#update', as: :update_single_contact
    delete '/api/contact/:id', to: 'contacts#destroy', as: :delete_single_contact
    patch '/api/contact/:id/star', to: 'contacts#star', as: :star_single_contact


    #users
    get '/api/user/signup', to: 'users#new', as: :signup_form
    post '/api/user/signin', to: 'users#authenticate', as: :authenticate
    post '/api/user/signup', to: 'users#create', as: :do_signup
    get '/api/user/signin', to: 'users#signin', as: :login
    get '/api/user/logout', to: 'users#logout', as: :logout
    get '/api/users', to: 'users#index', as: :all_users
    get '/api/user/me', to: 'users#me', as: :my_profile
    get '/api/user/:id', to: 'users#show', as: :show_single_user
    patch '/api/user/:id', to: 'users#update', as: :update_single_user
    delete '/api/user/:id', to: 'users#destroy', as: :delete_single_user

  #~ end
end
