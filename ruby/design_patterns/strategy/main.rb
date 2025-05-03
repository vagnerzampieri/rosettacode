# frozen_string_literal: true

# This code snippet demonstrates the use of the Strategy design pattern in Ruby.

# references:
# https://morningcoffee.io/interfaces-in-ruby.html
# https://refactoring.guru/design-patterns/strategy
# https://www.youtube.com/watch?v=DzlXwgsc_AU

require_relative './icms'
require_relative './ipi'
require_relative './iss'

TYPES = {
  'ICMS' => Icms,
  'ISS' => Iss,
  'IPI' => Ipi
}.freeze

p TYPES['ICMS'].new(100).calculate_tax
