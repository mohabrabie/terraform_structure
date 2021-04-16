class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body

      t.timestamps
      ## Note that t.timestamps is equv to:
      ##t.timestamp :updated_at
      ##t.timestamp :created_at
    end
  end
end
