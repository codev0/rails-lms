class CreateExaminations < ActiveRecord::Migration[6.1]
  def change
    create_table :examinations do |t|
      t.string :title

      t.timestamps
    end
  end
end
