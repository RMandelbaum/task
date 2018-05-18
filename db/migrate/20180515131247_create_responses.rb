class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.string  :content
      t.integer :task_detail_id

      t.timestamps
    end
  end
end
