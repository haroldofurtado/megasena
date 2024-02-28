# frozen_string_literal: true

require 'test_helper'

module Drawer
  class GeneratorTest < ActiveSupport::TestCase
    test 'generates a single set of numbers when quantity is 1' do
      generator = Drawer::Generator.new
      result = generator.generate

      assert_equal(:ok, result[:result])
      assert_instance_of(Hash, result)
      assert_instance_of(Array, result[:data])
      assert_equal(6, result[:data].size)
      assert(result[:data].all? { |number| number.between?(1, 60) })
    end

    test 'generates multiple sets of numbers when quantity is greater than 1' do
      generator = Drawer::Generator.new(validator: Drawer::Validator.new(quantity: 3))
      result = generator.generate

      assert_equal(:ok, result[:result])
      assert_instance_of(Hash, result)
      assert_instance_of(Array, result[:data])
      assert_equal(3, result[:data].size)
      assert(result[:data].all? { |set| set.is_a?(Array) && set.size == 6 })
    end

    test 'returns error data when generator is invalid' do
      invalid_generator = Drawer::Generator.new(validator: Drawer::Validator.new(quantity: nil))
      result = invalid_generator.generate

      assert_equal(:error, result[:result])
      assert_instance_of(Hash, result)
      assert_instance_of(Array, result[:data])
      assert_includes(result[:data], 'Quantity must be present')
      assert_includes(result[:data], 'Quantity must be a positive integer')
    end

    test 'formats a single set of numbers as a string when quantity is 1' do
      generator = Drawer::Generator.new
      formatted_result = generator.formated

      assert_equal(:ok, formatted_result[:result])
      assert_instance_of(Hash, formatted_result)
      assert_instance_of(String, formatted_result[:data])
      assert(formatted_result[:data].match?(/\A\d+-\d+-\d+-\d+-\d+-\d+\z/))
    end

    test 'formats multiple sets of numbers as a string when quantity is greater than 1' do
      generator = Drawer::Generator.new(validator: Drawer::Validator.new(quantity: 3))
      formatted_result = generator.formated

      assert_equal(:ok, formatted_result[:result])
      assert_instance_of(Hash, formatted_result)
      assert_instance_of(String, formatted_result[:data])
      assert(formatted_result[:data].match?(/\A(\d+-\d+-\d+-\d+-\d+-\d+, ){2}\d+-\d+-\d+-\d+-\d+-\d+\z/))
    end

    test 'returns error data when generator is invalid during formatting' do
      invalid_generator = Drawer::Generator.new(validator: Drawer::Validator.new(quantity: nil))
      formatted_result = invalid_generator.formated

      assert_equal(:error, formatted_result[:result])
      assert_instance_of(Hash, formatted_result)
      assert_instance_of(Array, formatted_result[:data])
      assert_includes(formatted_result[:data], 'Quantity must be present')
      assert_includes(formatted_result[:data], 'Quantity must be a positive integer')
    end
  end
end
