class CreateSnapshots < ActiveRecord::Migration
  def change
    create_table :snapshots do |t|
      t.string :file_path
      t.integer :user_id
      t.integer :video_id

      t.timestamps null:false
    end
  end
end
