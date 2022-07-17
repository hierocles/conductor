# frozen_string_literal: true

class RegionSerializer < ActiveModel::Serializer
  attributes :name, :factbook, :numnations, :nations, :delegate, :delegatevotes, :delegateauth, :founder,
             :founderauth, :officers, :power, :flag, :banner, :embassies, :lastupdate
end
