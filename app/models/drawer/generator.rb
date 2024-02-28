# frozen_string_literal: true

module Drawer
  class Generator
    def initialize(validator: Validator.new(quantity: 1))
      @validator = validator
    end

    def generate
      return return_errors if validator.invalid?

      return { result: :ok, data: (1..60).to_a.sample(6) } if quantity == 1

      { result: :ok, data: quantity.times.map { (1..60).to_a.sample(6) } }
    end

    def formated
      return return_errors if validator.invalid?

      result = generate
      return { result: :ok, data: result[:data].join('-') } if quantity == 1

      {
        result: :ok,
        data: result[:data].map { |numbers| numbers.join('-') }.join(', ')
      }
    end

    private

    def quantity
      validator.quantity
    end

    attr_reader :validator

    def return_errors
      { result: :error, data: validator.errors }
    end
  end
end
