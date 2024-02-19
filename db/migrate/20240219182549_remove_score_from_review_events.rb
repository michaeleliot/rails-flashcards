class RemoveScoreFromReviewEvents < ActiveRecord::Migration[7.1]
  def change
    remove_column :review_events, :score
    remove_column :cards, :review_time
  end
end
