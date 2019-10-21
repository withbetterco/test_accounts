Rails.application.routes.draw do
  mount TestAccounts::Engine => "/test_accounts"
end
