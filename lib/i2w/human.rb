# frozen_string_literal: true

require_relative 'human/version'

module I2w
  # TODO: jobs
  # - [ ] integrate with i18n
  # - [ ] display error objects
  # - [ ] default handler for objects which invites people to configure
  # - [ ] add configuration ability for extension
  module Human
    class << self
      def call(object)
        return object if object.is_a?(String)
        return object.to_human if object.respond_to?(:to_human)
        return object.model_name.human if object.respond_to?(:model_name)
        return object.name.humanize if object.is_a?(Module)
        return object.name if object.respond_to?(:name)

        object.to_s.humanize
      end
      alias [] call
    end
  end
end
