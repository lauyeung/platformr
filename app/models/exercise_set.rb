class ExerciseSet < ActiveRecord::Base
  belongs_to :exercise,
    inverse_of: :exercise_sets

  belongs_to :superset,
    inverse_of: :exercise_sets

  validates_presence_of :reps





end
