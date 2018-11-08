
Rails.application.routes.draw do
  devise_for :customers, controllers: { registrations: 'customers/registrations', sessions: 'customers/sessions' }
  devise_scope :customer do
  	get 'customers/sign_up/:id/show', to: 'devise/registrations#show', as: 'show_registration'
  	post 'customers/sign_up/:id/show', to: 'devise/registrations#show'
  end
  
  get 'welcome/index'
  	resources :customers
	resources :items
	get 'items/:id/modify', to: 'items#modify', as: 'modify_item'
	patch 'items/:id/modif', to: 'items#modif'
	post 'items/:id', to: 'items#modif'
	get 'customers/orders', to: 'orders#index', as: 'orders'
	post 'customers/orders', to: 'orders#create'
	get 'customers/orders/:id/new', to: 'orders#new', as: 'new_order'
	get 'customers/orders/:id/list', to: 'orders#list', as: 'list_order'
	get 'customers/orders/:id', to: 'orders#show', as: 'order' 
  root 'welcome#index'
  #match 'items/:id/modify', :to => 'items#modify', :as => 'modify_item',  :via => :get
	#match 'items/:id', :to => 'items#modif', via: [:patch ,:put]
	

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
