require_relative '../config'

class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.string :title
      t.string :name
      t.string :email
      t.string :phone
      t.string :fax
      t.string :website
      t.string :webform
      t.string :party
      t.string :gender
      t.date   :birthdate
      t.string :twitter_id
      t.string :state
      t.string :in_office
    end
  end
end
