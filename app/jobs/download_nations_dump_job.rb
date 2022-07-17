# frozen_string_literal: true

require 'open-uri'

#
# Downloads nations.xml.gz from NationStates and decompresses
#
class DownloadNationsDumpJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    File.delete('storage/dumps/nations.xml') if File.exist?('storage/dumps/nations.xml')
    File.open('storage/dumps/nations.xml', 'wb') do |file|
      URI.open('https://www.nationstates.net/pages/nations.xml.gz',
               'User-Agent' => Rails.configuration.outbound_user_agent) do |gzip|
        file.write(Zlib::GzipReader.new(gzip).read)
      end
    end
  end
end
