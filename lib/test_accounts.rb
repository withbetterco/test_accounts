require "test_accounts/configuration"
require "test_accounts/account_set"
require "test_accounts/engine"


module TestAccounts
  class << self
    def config
      return @config if defined?(@config)
      @config = Configuration.new
      @config.account_sets = []
      @config.basic_authentication_username = "test_accounts"
      @config.basic_authentication_password = "test_accounts"
      @config.support_email = nil
      @config
    end

    def configure(&block)
      config.instance_exec(&block)
    end
  end
end
