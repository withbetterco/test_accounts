module TestAccounts
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception
    before_action :basic_authentication
  
    def basic_authentication
      authenticate_or_request_with_http_basic do |username, password|
        username == TestAccounts.config.basic_authentication_username && password == TestAccounts.config.basic_authentication_password
      end
    end

  end
end
