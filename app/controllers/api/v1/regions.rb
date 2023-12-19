# frozen_string_literal: true

module API
  module V1
    #
    # Regions API
    #
    class Regions < Grape::API
      include API::V1::Defaults
      resource :regions do
        desc 'Return all regions'
        get '' do
          Nation.all
        end

        desc 'Return a region'
        params do
          requires :name, type: String, desc: 'The name of the region'
        end
        get ':name' do
          Region.where(name: permitted_params[:name].gsub(' ', '_').downcase).first!
        end
      end
    end
  end
end
