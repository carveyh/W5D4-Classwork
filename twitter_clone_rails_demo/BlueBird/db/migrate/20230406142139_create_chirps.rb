class CreateChirps < ActiveRecord::Migration[7.0]
  def change
    create_table :chirps do |t|
      t.text :body, null: false #t.string accepts up to 255 chars vs t.text by default accepts 65k chars, can do more. t.string 1 byte, t.text 4 bytes.
      t.integer :author_id, null: false

      t.timestamps
    end
    #use add_index whenever we consider user lookup behavior
    add_index :chirps, :author_id # no need to specify unique, if we do we would limit each author_id to only have 1 chirp.
  end
end
