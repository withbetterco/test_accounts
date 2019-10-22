require 'rails/generators'
module TestAccounts
  module Generators
    class ViewsGenerator < Rails::Generators::Base #:nodoc:
      source_root File.expand_path('../../..', __dir__)
      desc "Used to copy TestAccounts's views to your application's views."

      def copy_views
        directory 'app/views/test_accounts', 'app/views/test_accounts'
      end
    end
  end
end