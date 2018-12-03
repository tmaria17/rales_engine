Rails.application.routes.draw do
  namespace :api do
   namespace :v1 do
     namespace :merchants do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get '/:id/items', to: 'items#index'
        get '/:id/invoices', to: 'invoices#index'
        get '/most_revenue', to: 'most_revenue#index'
        get '/most_items', to: 'most_items#index'
        get '/revenue', to:'revenue_by_date#index'


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
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/merchant', to: 'merchants#show'
        get '/most_revenue', to: 'most_revenue#index'
        get '/most_items', to: 'most_items#index'

      end

      namespace :transactions do
        get 'find_all', to: 'search#index'
        get 'find', to: 'search#show'
        get '/:id/invoice', to: 'invoices#show'

      end

      namespace :invoices do
        get 'find_all', to: 'search#index'
        get 'find', to: 'search#show'
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/items', to: 'items#index'
        get '/:id/merchant', to: 'merchants#show'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/customer', to: 'customers#show'

      end

      namespace :invoice_items do
        get 'find_all', to: 'search#index'
        get 'find', to: 'search#show'
        get '/:id/invoice', to: 'invoices#show'
        get '/:id/item', to: 'items#show'
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
