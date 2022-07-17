# frozen_string_literal: true

class Nation < ApplicationRecord
  self.inheritance_column = :inheritance
  self.primary_key = :name
end
