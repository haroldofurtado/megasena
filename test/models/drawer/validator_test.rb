# frozen_string_literal: true

require 'test_helper'

module Drawer
  class ValidatorTest < ActiveSupport::TestCase
    test 'validates presence of quantity' do
      validator = Drawer::Validator.new
      assert validator.invalid?
      assert_includes validator.errors, 'Quantity must be present'
      assert_includes validator.errors, 'Quantity must be a positive integer'
    end

    test 'validates quantity is a positive integer' do
      validator = Drawer::Validator.new(quantity: -5)
      assert validator.invalid?
      assert_includes validator.errors, 'Quantity must be a positive integer'

      validator = Drawer::Validator.new(quantity: 'abc')
      assert validator.invalid?
      assert_includes validator.errors, 'Quantity must be a positive integer'
    end

    test 'validates quantity is less than or equal to twenty' do
      validator = Drawer::Validator.new(quantity: 25)
      assert validator.invalid?
      assert_includes validator.errors, 'Quantity must be less than or equal to 20'
    end

    test 'validates a valid quantity' do
      validator = Drawer::Validator.new(quantity: 10)
      assert validator.valid?
      assert_empty validator.errors
    end
  end
end
