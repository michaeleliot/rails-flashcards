class RenameImagePathColumnToImage < ActiveRecord::Migration[6.0]
  def change
    rename_column :cards, :name, :question
    rename_column :cards, :description, :answer
    rename_column :cards, :image_path, :question_image
    add_column :cards, :answer_image, :string
  end
end
