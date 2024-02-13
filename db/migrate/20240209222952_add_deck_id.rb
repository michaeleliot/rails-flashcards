class AddDeckId < ActiveRecord::Migration[7.1]
  def change
    add_reference :cards, :deck, foreign_key: true
  end
end
