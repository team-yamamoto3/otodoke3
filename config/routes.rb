Rails.application.routes.draw do
  root 'cds#index'
  post '/receipts/' => 'receipts#create'
  # get '/cds/arrivals' => 'arrivals#index'
  # get '/cds/:id/arrivals' => 'arrivals#create'
  get '/cds/arrivals/history' => 'arrivals#history'
  # get '/cds/:id/arrivals/new' => 'arrivals#new'
  # get '/cds/:id/arrivals/:id' => 'arrivals#create'
  get 'carts/index'
  get 'carts/show'
  get 'endusers/:id/history', to: 'endusers#history', as: 'history'
  resources :cds, only: [:index, :show, :create, :edit, :update] do
   resources :arrivals do
     end
      # カート機能
       resources :carts, only:[:create, :destroy, :update]
        collection do
         get 'thanks'
        end
       end
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :endusers, controllers: {
  sessions:      'endusers/sessions',
  passwords:     'endusers/passwords',
  registrations: 'endusers/registrations'
}
  resources :endusers, only: [:edit, :show, :update]
  get 'endusers/:id/addresses', to: 'addresses#index', as: 'enduser_addresses'
  get 'endusers/:enduser_id/addresses/:id/edit', to: 'addresses#edit', as: 'edit_enduser_address'
  delete 'endusers/:enduser_id/address/:id/destroy', to: 'addresses#destroy', as: 'enduser_address'
  post 'endusers/:enduser_id/addresses', to: 'addresses#create', as: 'create_enduser_addresses'
  patch 'endusers/:enduser_id/addresses/:id/update', to: 'addresses#update', as: 'update_enduser_addresses'
  #end

  resources :admin_cds do
    collection do
      get 'search'
    end
  end

  resources :receipts, only: [:index, :show, :edit, :update]

  get 'orders/index'
  get 'orders/show'
  get 'users/edit'
  # get 'admin_cds/search', as: 'cds_search'
  get 'carts/index'
  get 'admins/home', as: 'home'
  get 'admins/index'
  # For detailss on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
