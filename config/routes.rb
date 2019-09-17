Rails.application.routes.draw do
  root 'cds#index'
  resources :cds, only: [:index, :show, :create] do

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



  get 'orders/index'
  get 'orders/show'
  get 'users/edit'
  get 'admin_cds/index'
  get 'carts/index'
  get 'carts/show'
  get 'endusers/edit'
  get 'endusers/show'
  get 'admins/home', as: 'home'
  # For detailss on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
