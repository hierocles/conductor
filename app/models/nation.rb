# frozen_string_literal: true

#
# Nation model
# Primary key changed to name from id
# Inheritance column changed to inheritance from type
#
class Nation < ApplicationRecord
  self.inheritance_column = :inheritance
  self.primary_key = :name

  normalizes :name, with: ->(name) { name.gsub(' ', '_').downcase }

  scope :has_not_endorsed, lambda { |target|
                             select(:name)
                               .where('? <> ALL(endorsements)', target.downcase)
                               .where.not(unstatus: 'Non-member')
                               .where(region: Nation.find(target).region)
                               .order(:name)
                           }

  scope :not_endorsing, lambda { |target|
                          select(:name)
                            .where('LOWER(name) NOT IN (?)', Nation.find(target).endorsements.map do |n|
                                                               n.gsub('_', ' ')
                                                             end)
                            .where.not(unstatus: 'Non-member')
                                  .where(region: Nation.find(target).region)
                                  .order(:name)
                        }
end
