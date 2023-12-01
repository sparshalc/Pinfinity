class AddNameToPin < ActiveRecord::Migration[7.1]
  def change
    add_column :pins, :name, :string
  end
end
