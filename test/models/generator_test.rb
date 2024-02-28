# require 'test_helper'

# class GeneratorTest < ActiveSupport::TestCase
#   test '::generate returns an array of 6 integers between 1 and 60' do
#     # Arrange + Act
#     result = NumbersGenerator.generate

#     # Assert
#     assert_instance_of Array, result
#     assert_equal 6, result.size
#     assert(result.all? { |number| number.is_a?(Integer) })
#     assert(result.all? { |number| number >= 1 && number <= 60 })
#   end

#   test '::generate returns an array of arrays of 6 integers between 1 and 60' do
#     # Arrange + Act
#     result = NumbersGenerator.generate(quantity: 2)

#     # Assert
#     assert_instance_of(Array, result)
#     assert_equal(2, result.size)
#     assert(result.all? { |numbers| numbers.is_a?(Array) })
#     assert(result.all? { |numbers| numbers.size == 6 })
#     assert(result.all? { |numbers| numbers.all? { |number| number.is_a?(Integer) } })
#     assert(result.all? { |numbers| numbers.all? { |number| number >= 1 && number <= 60 } })
#   end

#   test '::call returns a string in the format "1-2-3-4-5-6"' do
#     # Arrange
#     NumbersGenerator.stub(:generate, [1, 2, 3, 4, 5, 6]) do
#       # Act
#       result = NumbersGenerator.formated
#       # Assert
#       assert_equal('1-2-3-4-5-6', result)
#     end
#   end

#   test '::call returns a string in the format "1-2-3-4-5-6, 1-2-3-4-5-6"' do
#     # Arrange
#     NumbersGenerator.stub(:generate, [[1, 2, 3, 4, 5, 6], [1, 2, 3, 4, 5, 6]]) do
#       # Act
#       result = NumbersGenerator.formated(quantity: 2)
#       # Assert
#       assert_equal('1-2-3-4-5-6, 1-2-3-4-5-6', result)
#     end
#   end
# end
