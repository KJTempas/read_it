class AddDescriptionToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :description, :string
  end
end
