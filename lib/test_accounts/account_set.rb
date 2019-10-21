module TestAccounts
  class AccountSet
    attr_accessor :resources, :attributes, :options

    def initialize(resource, attributes = [], options = {})
      @resource = resource
      @attributes = attributes
      @options = options

      @resources = @resource.constantize.all
    end

  end
end