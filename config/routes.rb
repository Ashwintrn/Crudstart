
Rails.application.routes.draw do
  #devise_for :customers
  get 'welcome/index'
	resources :customers, :items
	get 'items/:id/modify', to: 'items#modify', as: 'modify_item'
	put 'items/:id', to: 'items#modif'
  root 'welcome#index'
  #match 'items/:id/modify', :to => 'items#modify', :as => 'modify_item',  :via => :get
	#match 'items/:id', :to => 'items#modif', via: [:patch ,:put]
	

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
