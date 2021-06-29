# frozen_string_literal: true

class CreateFollowingRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :following_relationships do |t|
      t.integer :followed_id
      t.integer :follower_id
      t.timestamps
    end
    add_index :following_relationships, :follower_id
    add_index :following_relationships, :followed_id # 順番を綺麗に並べてくれる（読み込みが早くなる、が書き込みは遅くなる。なんで？）
    add_index :following_relationships, %I[follower_id followed_id], unique: true
  end
end
