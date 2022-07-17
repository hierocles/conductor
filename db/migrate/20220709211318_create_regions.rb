# frozen_string_literal: true

#
# Create regions table
#
class CreateRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :regions, id: false do |t|
      t.string :name, primary_key: true
      t.text :factbook
      t.integer :numnations
      t.text :nations, array: true, default: []
      t.string :delegate
      t.integer :delegatevotes
      t.string :delegateauth
      t.string :founder
      t.string :founderauth
      t.jsonb :officers, default: {}
      t.string :power
      t.string :flag
      t.integer :banner
      t.jsonb :embassies, default: {}
      t.integer :lastupdate

      t.timestamps
    end

    add_index :regions, :name, unique: true
  end
end
