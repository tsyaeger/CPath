class CreateJobDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :job_documents do |t|
      t.integer :job_id
      t.integer :document_id

      t.timestamps
    end
  end
end
