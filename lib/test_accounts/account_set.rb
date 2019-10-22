module TestAccounts
  class AccountSet
    attr_accessor :resources, :attributes, :options

    def initialize(resource, scope = "all", attributes = [], options = {})
      @resource = resource
      @scope = scope
      @attributes = attributes
      @options = options
    end

    def resources
      @resource.constantize.send(@scope)
    end

  end
end