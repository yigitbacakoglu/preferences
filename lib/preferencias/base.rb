require 'active_record'

module Preferencias
  class Base < ActiveRecord::Base
    include Preferencias::Preferable

    if Gem::Version.new(ActiveRecord::VERSION::STRING) >= Gem::Version.new("7.1")
      serialize :preferences, coder: YAML, type: Hash
    else
      serialize :preferences, Hash
    end
    after_initialize do
      self.preferences = default_preferences.merge(preferences) if has_attribute?(:preferences)
    end

    self.abstract_class = true
  end
end
