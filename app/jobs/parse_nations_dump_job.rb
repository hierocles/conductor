# frozen_string_literal: true

#
# Parses nations.xml into nations table
#
class ParseNationsDumpJob < ApplicationJob
  queue_as :default

  #
  # <Description>
  #
  # @param [<Type>] *args <description>
  #
  # @return [<Type>] <description>
  #
  def perform(_args)
    Rake::Task['parse_nations'].invoke
  end
end
