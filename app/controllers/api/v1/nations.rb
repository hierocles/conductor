# frozen_string_literal: true

module API
  module V1
    #
    # Nations API
    #
    class Nations < Grape::API
      include API::V1::Defaults
      resource :nations do
        desc 'Return all nations'
        get '' do
          Nation.all
        end

        desc 'Return a nation'
        params do
          requires :name, type: String, desc: 'The name of the nation'
        end
        get ':name' do
          Nation.where(name: permitted_params[:name]).first!
        end

        desc 'Subset of nations that can be endorsed by target nation'
        params do
          requires :name, type: String, desc: 'The name of the nation'
        end
        get ':name/endorsable' do
          render Nation.has_not_endorsed(permitted_params[:name]), serializer: NationNameSerializer
        end

        desc 'Subset of nations that are not yet endorsing the target nation'
        params do
          requires :name, type: String, desc: 'The name of the nation'
        end
        get ':name/not_endorsed_by' do
          render Nation.not_endorsing(permitted_params[:name]), serializer: NationNameSerializer
        end
      end
    end
  end
end
