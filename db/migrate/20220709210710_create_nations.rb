# frozen_string_literal: true

#
# Create nations table
#
class CreateNations < ActiveRecord::Migration[7.0]
  def change
    create_table :nations, id: false do |t|
      t.string :name, primary_key: true
      t.string :type
      t.string :fullname
      t.string :motto
      t.string :category
      t.string :unstatus
      t.text :endorsements, array: true, default: []
      t.integer :issues_answered
      t.jsonb :freedom, default: {}
      t.string :region
      t.integer :population
      t.integer :tax
      t.string :animal
      t.string :currency
      t.string :demonym
      t.string :demonym2
      t.string :demonym2plural
      t.string :flag
      t.string :majorindustry
      t.string :govtpriority
      t.jsonb :govt, default: {}
      t.integer :founded
      t.integer :firstlogin
      t.integer :lastlogin
      t.string :lastactivity
      t.string :influence
      t.jsonb :freedomscores, default: {}
      t.integer :publicsector
      t.jsonb :deaths, default: {}
      t.string :leader
      t.string :capital
      t.string :religion
      t.integer :factbooks
      t.integer :dispatches
      t.integer :dbid

      t.timestamps
      t.string :inheritance
    end

    add_index :nations, :name, unique: true
    add_index :nations, :unstatus
    add_index :nations, :region
  end
end
