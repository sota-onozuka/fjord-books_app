# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.references :commentable, polymorphic: true
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
