module TestAccounts
  class AccountSetsController < TestAccounts::ApplicationController
    
    def index
      @account_sets = TestAccounts.config.account_sets
    end

  end
end