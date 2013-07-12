require_relative '../config'

class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.string :type
      t.string :title
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :name_suffix
      t.string :party
      t.string :state
      t.string :gender
      t.string :phone
      t.string :fax
      t.string :webform
      t.string :website
      t.string :twitter_id
      t.string :youtube_url
      t.string :facebook_id
      t.string :birthdate
      t.timestamps
    end
  end
end