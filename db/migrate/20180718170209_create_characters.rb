class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.text :name
      t.text :gender
      t.text :culture
      t.boolean :dead

      t.timestamps
    end
  end
end
