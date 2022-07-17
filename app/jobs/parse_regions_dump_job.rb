# frozen_string_literal: true

#
# Parses regions.xml into regions table
#
class ParseRegionsDumpJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
  end
end
