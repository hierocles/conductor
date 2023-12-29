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
          Region.where(name: permitted_params[:name]).first!
        end

        desc 'Returns names of nations in the region not endorsing the delegate'
        params do
          requires :name, type: String, desc: 'The name of the region'
        end
        get ':name/not_endorsing_delegate' do
          region = Region.where(name: permitted_params[:name]).first!
          delegate_nation = Nation.where(name: region.delegate).first!

          render Nation.where(unstatus: 'WA Member')
                       .where('lower(region) = ?',
                              permitted_params[:name].downcase.gsub('_', ' '))
                       .where.not(name: delegate_nation.endorsements),
                 serializer: NationNameSerializer
        end
      end
    end
  end
end
