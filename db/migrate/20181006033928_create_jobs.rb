class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :position
      t.string :url
      t.datetime :date_posted, :null => false, :default => Time.now
      t.string :job_desc
      t.string :co_desc
      t.boolean :applied, default: false
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end


