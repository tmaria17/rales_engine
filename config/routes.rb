Rails.application.routes.draw do
  namespace :api do
   namespace :v1 do
     namespace :merchants do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
      end

      namespace :customers do
        get 'find_all', to: 'search#index'
        get 'find', to: 'search#show'
      end

      namespace :items do
        get 'find_all', to: 'search#index'
        get 'find', to: 'search#show'
      end

      namespace :transactions do
        get 'find_all', to: 'search#index'
        get 'find', to: 'search#show'
      end
      
      namespace :invoices do
        get 'find_all', to: 'search#index'
        get 'find', to: 'search#show'
      end
     resources :merchants, only: [:index, :show]
     resources :items, only: [:index, :show]
     resources :transactions, only: [:index, :show]
     resources :customers, only: [:index, :show]
     resources :invoices, only: [:index, :show]
     resources :invoice_items, only: [:index, :show]





   end
 end
end
