class DropReviewEventsAndAddReviewTimeToCards < ActiveRecord::Migration[7.1]
  def change
    add_column :cards, :review_time, :datetime
    drop_table :review_events
  end
end
