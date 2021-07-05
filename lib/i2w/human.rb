# frozen_string_literal: true

require_relative 'human/version'

module I2w
  # TODO:
  # - [ ] integrate with i18n
  # - [ ] display error objects
  # - [ ] default handler for objects which invites people to configure
  # - [ ] add configuration ability for extension
  #       
  module Human
    extend self

    def call(object)
      return object.to_human if object.respond_to?(:to_human)
      return object.name if object.respond_to?(:name)
      
      object.to_s.humanize
    end
    alias [] call
  end
end
