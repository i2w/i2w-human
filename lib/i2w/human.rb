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
        return for_errors(object) if object.respond_to?(:full_messages)
        return for_module(object) if object.is_a?(Module)
        return object.name if object.respond_to?(:name)
        return object.model_name.human if object.respond_to?(:model_name)

        object.to_s.humanize
      end
      alias [] call

      def for_module(object) = object.respond_to?(:model_name) ? object.model_name.human : object.name.humanize

      def for_errors(object) = "Errors: #{object.full_messages.join(', ')}"
    end
  end
end
