class CreateShortenedUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :shortened_urls do |t|
      t.string :short_url, null: false
      t.string :long_url, index: {unique: true}, null: false
      t.timestamps
    end
  end
end
