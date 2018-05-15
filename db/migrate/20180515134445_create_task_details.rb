class CreateTaskDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :task_details do |t|
      t.string :name
      t.string :question
      t.string :response
      t.date :due_date
      t.integer :category_id
      t.timestamps
    end
  end
end
