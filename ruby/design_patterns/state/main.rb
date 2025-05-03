# frozen_string_literal: true

# This code snippet demonstrates the use of the State design pattern in Ruby.
# Gems you can use:
# - state_machines
# - aasm

# references:
# https://www.youtube.com/watch?v=OrCgWzpNszk
# https://refactoring.guru/design-patterns/state

require_relative 'order'
require_relative 'placed'

order = Order.new
order.prepare_order
order.start_delivery
order.finalize_delivery

p order
