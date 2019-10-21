module TestAccounts
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception
    before_action :raise_not_found_error, if: :production_server?
    before_action :basic_authentication
  
    private

    def production_server?
      Rails.env.production?
    end
  
    def raise_not_found_error
      raise ActionController::RoutingError, 'Not Found'
    end

    def basic_authentication
      authenticate_or_request_with_http_basic do |username, password|
        username == TestAccounts.config.basic_authentication_username && password == TestAccounts.config.basic_authentication_password
      end
    end

  end
end
