class CreateExercises < ActiveRecord::Migration[7.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :force
      t.integer :level
      t.integer :mechanic
      t.string :equipment
      t.string :category
      t.text :instructions
      t.text :primary_muscles
      t.text :secondary_muscles
      t.text :images

      t.timestamps
    end
  end
end
