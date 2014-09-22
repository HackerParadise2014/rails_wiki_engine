class CreateRailsWikiArticles < ActiveRecord::Migration
  def change
    create_table :rails_wiki_articles do |t|
      t.string :title
      t.text :text
      t.string :slug

      t.boolean :archived
      t.boolean :protected

      t.timestamps
    end
  end
end
