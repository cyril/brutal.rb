# frozen_string_literal: true

require "yaml"

module Brutal
  # Brutal::Yaml
  #
  # @since 1.1.0
  module Yaml
    FILENAME_EXTENSIONS = %w[
      yaml
      yml
    ].freeze

    def self.parse(yaml)
      ::YAML.safe_load(yaml, symbolize_names: false)
    end

    def self.parse?(filename)
      filename_extension = filename.split(".")[1..][-1]
      FILENAME_EXTENSIONS.include?(filename_extension)
    end
  end
end
