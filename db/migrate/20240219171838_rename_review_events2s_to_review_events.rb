class RenameReviewEvents2sToReviewEvents < ActiveRecord::Migration[7.1]
  def change
    rename_table :review_events2s, :review_events
  end
end
