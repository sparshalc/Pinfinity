class AddDescriptionToPin < ActiveRecord::Migration[7.1]
  def change
    add_column :pins, :description, :text
  end
end
