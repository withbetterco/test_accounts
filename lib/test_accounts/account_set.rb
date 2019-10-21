module TestAccounts
  class AccountSet
    attr_accessor :resources, :attributes, :options

    def initialize(resource, scope = "", attributes = [], options = {})
      @resource = resource
      @scope = scope
      @attributes = attributes
      @options = options
    end

    def resources
      @resource.constantize.all unless @scope.present?
      @resource.constantize.send(@scope)
    end

  end
end