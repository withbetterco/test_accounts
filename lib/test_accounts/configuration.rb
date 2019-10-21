module TestAccounts
  class Configuration
    # An Account Set is a number of accounts, grouped together 
    # for listing at the Test Accounts page.
    attr_accessor :account_sets

    # Username and password for basic authentication
    attr_accessor :basic_authentication_username
    attr_accessor :basic_authentication_password
    
    # Email for questions/issues
    attr_accessor :support_email

  end
end