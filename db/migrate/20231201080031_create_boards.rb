class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.boolean :isPrivate
      t.string :name
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
