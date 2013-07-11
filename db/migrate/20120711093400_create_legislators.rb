require_relative '../config'

class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :type
      t.string :name
      t.string :party
      t.string :state
      t.string :gender
      t.string :phone
      t.string :website
      t.string :twitter_id
      t.string :youtube_url
      t.string :facebook_id
      t.string :birthdate
      t.timestamps
    end
  end
end