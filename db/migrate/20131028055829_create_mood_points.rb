class CreateMoodPoints < ActiveRecord::Migration
  def up
    create_table :mood_points do |t|
      t.integer :mood_score
      t.integer :user_id
      t.string :text

      t.timestamps
      # adds created_at and updated_at columns
    end
  end

  def down
    drop_table :mood_points
  end
end
