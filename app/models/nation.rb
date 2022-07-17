# frozen_string_literal: true

#
# Nation model
# Primary key changed to name from id
# Inheritance column changed to inheritance from type
#
class Nation < ApplicationRecord
  self.inheritance_column = :inheritance
  self.primary_key = :name
end
