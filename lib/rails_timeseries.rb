require "rails_timeseries/version"
require "rails"

module RailsTimeseries
  extend ::ActiveSupport::Concern
  included do
    cattr_accessor :timeseries_scopes
  end

  class_methods do
    def timeseries_scope(name, &block)
      self.timeseries_scopes ||= []
      self.timeseries_scopes << name
      define_singleton_method name, block
    end
  end
end
