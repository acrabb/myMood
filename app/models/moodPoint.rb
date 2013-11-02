class MoodPoint < ActiveRecord::Base
  attr_accessible :created_at, :mood_score, :user_id
end
