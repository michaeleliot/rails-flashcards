class AddUserIdToDecks < ActiveRecord::Migration[7.1]
  def change
    add_reference :decks, :user, foreign_key: true
  end
end
