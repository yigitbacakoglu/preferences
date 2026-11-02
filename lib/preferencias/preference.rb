module Preferencias
  class Preference < Base
    if Gem::Version.new(ActiveRecord::VERSION::STRING) >= Gem::Version.new("7.1")
      serialize :value, coder: YAML
    else
      serialize :value
    end
    validates :key, presence: true, uniqueness: true
  end
end
