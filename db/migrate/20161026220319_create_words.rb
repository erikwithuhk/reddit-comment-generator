class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.string :word, null: false
      t.float :frequency, null: false
      t.text :next_words, null: false, default: "[]"
    end
  end
end
