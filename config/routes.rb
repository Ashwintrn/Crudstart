
Rails.application.routes.draw do
  get 'welcome/index'
	resources :customers, :items
  root 'welcome#index'
  match 'items/:id/modify', :to => 'items#modify', :as => 'modify_item', via: [:get , :post]
	#get "items/:id/modify" to => 'items#modify'
	#put "items/:id"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
