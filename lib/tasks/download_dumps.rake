# frozen_string_literal: true

require 'open-uri'

desc 'Download Daily Dumps from NationStates'

namespace :download do
  task regions: :environment do
    File.delete('storage/dumps/regions.xml') if File.exist?('storage/dumps/regions.xml')
    File.open('storage/dumps/regions.xml', 'wb') do |file|
      URI.open('https://www.nationstates.net/pages/regions.xml.gz',
               'User-Agent' => Rails.configuration.outbound_user_agent) do |gzip|
        file.write(Zlib::GzipReader.new(gzip).read)
      end
    end
    Rails.logger.info "Downloaded regions.xml at #{Time.zone.now}"
  end

  task nations: :environment do
    File.delete('storage/dumps/nations.xml') if File.exist?('storage/dumps/nations.xml')
    File.open('storage/dumps/nations.xml', 'wb') do |file|
      URI.open('https://www.nationstates.net/pages/nations.xml.gz',
               'User-Agent' => Rails.configuration.outbound_user_agent) do |gzip|
        file.write(Zlib::GzipReader.new(gzip).read)
      end
    end
    Rails.logger.info "Downloaded nations.xml at #{Time.zone.now}"
  end
end
