# frozen_string_literal: true

# This code snippet demonstrates the use of the Strategy design pattern in Ruby.

require_relative './icms'
require_relative './ipi'
require_relative './iss'

TYPES = {
  'ICMS' => Icms,
  'ISS' => Iss,
  'IPI' => Ipi
}.freeze

p TYPES['ICMS'].new(100).calculate_tax
