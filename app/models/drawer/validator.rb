# frozen_string_literal: true

module Drawer
  class Validator
    attr_reader :errors

    def initialize(params = {})
      @params = params
      @errors = []
      validate!
    end

    def valid?
      @errors.empty?
    end

    def invalid?
      !valid?
    end

    def quantity
      normalized_quantity
    end

    private

    def validate!
      @errors << 'Quantity must be present' unless quantity_present?
      @errors << 'Quantity must be a positive integer' unless positive_integer?
      @errors << 'Quantity must be less than or equal to 20' unless less_than_or_equal_to_twenty?
    end

    def quantity_present?
      @params[:quantity].present?
    end

    def positive_integer?
      quantity.is_a?(Integer) && quantity.positive?
    end

    def less_than_or_equal_to_twenty?
      quantity <= 20
    end

    def normalized_quantity
      @params[:quantity].to_i
    end
  end
end
