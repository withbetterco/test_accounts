module TestAccounts
  class AccountSet
    attr_accessor :resources, :attributes, :options

    def initialize(resource, resource_ids = [], attributes = [], options = {})
      @resource = resource
      @resource_ids = resource_ids
      @attributes = attributes
      @options = options
    end

    def resources
      @resource.constantize.all if @resource_ids.empty?
      @resource.constantize.where(id: @resource_ids)
    end

  end
end