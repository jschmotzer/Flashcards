class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.belongs_to :card
      t.boolean :correct
      t.belongs_to :round

      t.timestamps
    end
  end
end
