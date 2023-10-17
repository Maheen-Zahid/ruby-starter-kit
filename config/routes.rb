Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "hello#index"

  get "mgmt" => "hello#mgmt_index"
  post "mgmt_create_organization" => "hello#create_organization"

  get "callback" => "auth#callback"
  get "auth" => "auth#auth"
  get "logout" => "auth#logout"
  get "logout_callback" => "auth#logout_callback"
  get "client_credentials_auth" => "auth#client_credentials_auth"
  get "sign_up" => "auth#sign_up"
  resources :users, only: [:create, :new] do 
    collection do
      get :show_user 
    end
  end
  resources :playgrounds, only: [:index] do
    collection do
      get :get_flag
    end
  end
end
