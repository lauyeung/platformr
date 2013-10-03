class ExerciseSet < ActiveRecord::Base

  belongs_to :exercise,
    inverse_of: :exercise_sets

  belongs_to :superset,
    inverse_of: :exercise_sets

  validates_presence_of :reps
  validates_presence_of :exercise
  validates_presence_of :superset

  validates_numericality_of :reps, only_integer: true

end
