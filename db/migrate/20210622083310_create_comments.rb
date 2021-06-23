class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :body
      t.references :commentable, polymorphic: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
