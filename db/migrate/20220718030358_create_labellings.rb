class CreateLabellings < ActiveRecord::Migration[6.0]
  def change
    create_table :labellings do |t|
      t.integer :task_id, null: false
      t.integer :label_id, null: false
      t.index ["label_id"], name: "index_labellings_on_label_id"
      t.index ["task_id"], name: "index_labellings_on_task_id"
      t.timestamps
    end
    add_foreign_key :labellings, :labels
    add_foreign_key :labellings, :tasks
  end
end
