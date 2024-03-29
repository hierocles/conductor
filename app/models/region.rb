# frozen_string_literal: true

#
# Region model
# Primary key changed to name from id
#
class Region < ApplicationRecord
  self.primary_key = :name

  normalizes :name, with: ->(name) { name.gsub(' ', '_').downcase }
end
