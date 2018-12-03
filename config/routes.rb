Rails.application.routes.draw do
  namespace :api do
   namespace :v1 do
     namespace :merchants do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get '/:id/items', to: 'items#index'
        get '/:id/invoices', to: 'invoices#index'
      end

      namespace :customers do
        get 'find_all', to: 'search#index'
        get 'find', to: 'search#show'
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/transactions', to: 'transactions#index'

      end

      namespace :items do
        get 'find_all', to: 'search#index'
        get 'find', to: 'search#show'
      end

      namespace :transactions do
        get 'find_all', to: 'search#index'
        get 'find', to: 'search#show'
        get '/:id/invoice', to: 'invoices#show'

      end

      namespace :invoices do
        get 'find_all', to: 'search#index'
        get 'find', to: 'search#show'
      end

      namespace :invoice_items do
        get 'find_all', to: 'search#index'
        get 'find', to: 'search#show'
        get '/:id/invoice', to: 'invoices#show'

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
