Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :employees do
    resources :expenses 
    get "/expense_report", to: "expenses#expense_report" 
  end
  resources :comments
  get "/employee_details/:id", to: "admin#show"
  post "/employees/:id/expenses/validate", to: "expenses#validate"
  # Defines the root path route ("/")
  # root "articles#index"
end
