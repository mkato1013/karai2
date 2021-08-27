class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.integer :following_id, null: false, foreign_key:{ to_table: :users }
      t.integer :follower_id, null: false, foreign_key:{ to_table: :users }

      t.timestamps
    end
  end
end
