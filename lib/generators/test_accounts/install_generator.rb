require 'rails/generators'
module TestAccounts
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Installs TestAccounts engine"
      source_root File.expand_path("../../templates", __FILE__)

      def add_initializer
        path = "#{Rails.root}/config/initializers/test_accounts.rb"
        if File.exist?(path)
          puts 'Skipping config/initializers/test_accounts.rb creation, as file already exists!'
        else
          puts 'Adding Notifications initializer (config/initializers/test_accounts.rb)...'
          template 'test_accounts.rb', path
        end
      end

      def add_routes
        route 'mount TestAccounts::Engine => "/test_accounts"'
      end
      
    end
  end
end