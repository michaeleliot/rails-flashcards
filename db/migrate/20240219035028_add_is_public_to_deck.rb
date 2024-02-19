class AddIsPublicToDeck < ActiveRecord::Migration[7.1]
  def change
    add_column :decks, :is_public, :boolean
  end
end
