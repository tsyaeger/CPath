class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :description
      t.datetime :due_date, null: false
      t.boolean :completed, default: false
      t.integer :contact_id
      t.integer :document_id
      t.integer :job_id
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end


