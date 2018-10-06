class CreateJobContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :job_contacts do |t|
      t.integer :job_id
      t.integer :contact_id

      t.timestamps
    end
  end
end
