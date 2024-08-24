require 'sinatra'
require 'dry-transaction'
require 'dry-validation'
require 'debug'
require 'ruby-prof'

class CartContract < Dry::Validation::Contract
  params do
    required(:name).filled
    required(:email).filled
    required(:payment_method).filled
    required(:items).each do
      schema do
        required(:sku).filled
        required(:amount).filled
        required(:discount).filled
      end
    end
  end
end

class CartTransaction
  include Dry::Transaction

  step :validate
  step :apply_discounts
  step :calculate_total

  def validate(input)
    result = CartContract.new.call(input)
    result.success? ? Success(input) : Failure("Errors: #{result.errors.messages.map(&:to_h)}")
  end

  def apply_discounts(input)
    items = input[:items].map do |item|
      item[:amount] -= item[:amount] * item[:discount]
      item
    end

    Success(input.merge(items:))
  end

  def calculate_total(input)
    total = input[:items].map { |item| item[:amount] }.sum
    Success(total)
  end
end

get '/' do
  cart_params = {
    name: 'John',
    email: 'john@doe.com',
    payment_method: 'credit_card',
    items: [
      { sku: 123, amount: 132.75, discount: 0.1 },
      { sku: 123, amount: 117.11, discount: 0.0 },
      { sku: 123, amount: 99.99, discount: 0.05 }
    ]
  }

  CartTransaction.new.call(cart_params) do |result|
    result.success do |value|
      "Total: #{value}"
    end

    result.failure do |error|
      error
    end
  end
end
