# frozen_string_literal: true

require 'open-uri'

#
# Downloads regions.xml.gz from NationStates and decompresses
#
class DownloadRegionsDumpJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    File.delete('storage/dumps/regions.xml') if File.exist?('storage/dumps/regions.xml')
    File.open('storage/dumps/regions.xml', 'wb') do |file|
      URI.open('https://www.nationstates.net/pages/regions.xml.gz',
               'User-Agent' => Rails.configuration.outbound_user_agent) do |gzip|
        file.write(Zlib::GzipReader.new(gzip).read)
      end
    end
  end
end
