Rails.application.routes.draw do
  root 'cds#index'
  resources :cds, only: [:index, :show, :create] do
    # カート機能
    resource :carts, only:[:create, :destroy]

    collection do
      get 'thanks'
    end
  end
  
  get 'arrivals/new'
  post '/arrivals/', to: 'arrivals#create'
  get 'arrivals/index'
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
  resources :admin_cds, only: [:index, :show, :edit, :destroy, :update]


  get 'orders/index'
  get 'orders/show'
  get 'users/edit'
  get 'admin_cds/search', as: 'cds_search'
  get 'admin_cds/index'
  get 'carts/index'
  get 'carts/show'
  get 'admins/home', as: 'home'
  get 'admins/index'
  # For detailss on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
