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
          sql = <<-SQL
            SELECT name FROM nations
            WHERE :target_name_lower <> ALL(endorsements)
            AND region = (SELECT region FROM nations WHERE name = :target_name)
            AND unstatus='WA Member' ORDER BY name ASC
          SQL

          ActiveRecord::Base.connection.execute(
            ApplicationRecord.sanitize_sql([sql,
                                            { target_name_lower: permitted_params[:name].downcase,
                                              target_name: permitted_params[:name] }])
          )
        end
      end
    end
  end
end
