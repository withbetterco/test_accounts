TestAccounts::Engine.routes.draw do
  resources :account_sets, only: [:index]

  root to: "account_sets#index"
end
