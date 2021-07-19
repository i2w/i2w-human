# frozen_string_literal: true

require 'test_helper'

module I2w
  class HumanTest < ActiveSupport::TestCase
    class Foo
      def to_human
        'A medium sized foo'
      end
    end

    class Bar
      def name
        'Bingo'
      end
    end

    test 'it returns String untouched' do
      assert_equal 'Hi There!', Human.call('Hi There!')
    end

    test 'it uses #name if it exists' do
      assert_equal 'Bingo', Human.call(Bar.new)
    end

    test 'it uses #to_human if it exists' do
      assert_equal 'A medium sized foo', Human.call(Foo.new)
    end

    test 'it can be called with .call or []' do
      assert_equal '[1, 2]', Human.call([1, 2])
      assert_equal '[1, 2]', Human[[1, 2]]
    end
  end
end
