class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :description
      t.string :image_path
      t.datetime :review_time

      t.timestamps
    end
  end
end
