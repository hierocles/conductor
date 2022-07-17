# frozen_string_literal: true

module API
  module V1
    class Base < Grape::API
      mount API::V1::Nations
      mount API::V1::Regions
    end
  end
end
