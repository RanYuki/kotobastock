class AddCategoryToSource < ActiveRecord::Migration[5.2]
  def change
    add_column :sources, :category, :integer
  end
end
