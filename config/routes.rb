Rails.application.routes.draw do
  root 'cds#index'
  # get '/cds/arrivals' => 'arrivals#index'
  # get '/cds/:id/arrivals' => 'arrivals#create'
  get '/cds/arrivals/history' => 'arrivals#history'
  # get '/cds/:id/arrivals/new' => 'arrivals#new'
  # get '/cds/:id/arrivals/:id' => 'arrivals#create'
  resources :cds, only: [:index, :show, :create, :edit, :update] do
   resources :arrivals do
     end
      # カート機能
       resources :carts, only:[:show, :create, :destroy, :update]
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
  resources :admin_cds do
    collection do
      get 'search'
    end
  end
  get 'orders/index'
  get 'orders/show'
  get 'users/edit'
  # get 'admin_cds/search', as: 'cds_search'
  get 'carts/index'
  # get 'carts/show'
  get 'admins/home', as: 'home'
  get 'admins/index'
  # For detailss on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
