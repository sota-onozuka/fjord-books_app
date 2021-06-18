class CreateFollowingRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :following_relationships do |t|
      t.integer :following_id
      t.integer :fllower_id

      t.timestamps
    end
  end
end
