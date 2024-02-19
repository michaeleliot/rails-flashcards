class DropDeckCardsTable2 < ActiveRecord::Migration[7.1]
  def change
    drop_table :deck_cards
  end
end
