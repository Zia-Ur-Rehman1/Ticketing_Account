Rails.application.routes.draw do
  
  resources :customer_suppliers do
    collection do
      get 'customers', to: 'customer_suppliers#customers'
      get 'suppliers', to: 'customer_suppliers#suppliers'
      get :export_csv
      get :export_pdf
      get :range
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "customer_suppliers#index"
  get 'customer/:name/customer_supplier', to: 'customer_suppliers#customer', as: :customer_customer_supplier
  get 'supplier/:name/customer_supplier', to: 'customer_suppliers#supplier', as: :supplier_customer_supplier
end
