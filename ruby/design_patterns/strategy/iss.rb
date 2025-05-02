# frozen_string_literal: true

require_relative './tax_type_interface'

# This code snippet defines the Iss class, which represents a specific tax type
# that includes the TaxTypeInterface module. The class implements the
# calculate_tax
class Iss
  include TaxTypeInterface

  def initialize(income)
    @income = income
  end

  def calculate_tax
    @income * 0.11
  end
end
