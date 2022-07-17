class NationSerializer < ActiveModel::Serializer
   attributes :name, :type, :fullname, :motto, :category, :unstatus, :endorsements, :issues_answered, :freedom, :region, :population, :tax, :animal, :currency, :demonym, :demonym2, :demonym2plural, :flag, :majorindustry, :govtpriority, :govt, :founded, :firstlogin, :lastlogin, :lastactivity, :influence, :freedomscores, :publicsector, :deaths, :leader, :capital, :religion, :factbooks, :dispatches, :dbid
end
