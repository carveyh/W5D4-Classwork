class ChangeLikesIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index :likes, :chirp_id
    add_index :likes, [:chirp_id, :liker_id], unique: true
  end
end
