# frozen_string_literal: true

require_relative 'creator'
require_relative 'concrete_product'

# Concrete Creators override the factory method in order to change the resulting
# product's type.
class ConcreteCreator < Creator
  # Note that the signature of the method still uses the abstract product type,
  # even though the concrete product is actually returned from the method. This
  # way the Creator can stay independent of concrete product classes.
  def factory_method
    ConcreteProduct.new
  end
end
