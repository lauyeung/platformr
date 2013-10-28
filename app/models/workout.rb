class Workout < ActiveRecord::Base
  has_many :combinations,
    inverse_of: :workout,
    dependent: :destroy

  has_many :supersets, through: :combinations
  has_many :exercise_sets, through: :supersets
  has_many :exercises, through: :exercise_sets

  accepts_nested_attributes_for :combinations,
    reject_if: proc { |a| a[:sets].blank?; },
    allow_destroy: true

  belongs_to :user,
    inverse_of: :workouts

  validates_presence_of :workout_date
  validates_presence_of :user

  validates_presence_of :combinations

  def utc_workout_date
    workout_date = workout_date.to_time.utc
  end

  def self.max_weight_by_date(exercise)
    joins('JOIN combinations ON workouts.id = combinations.workout_id ' +
      'JOIN supersets ON supersets.combination_id = combinations.id ' +
      'JOIN exercise_sets ON exercise_sets.superset_id = supersets.id')
      .where('exercise_sets.exercise_id = ?', exercise.id)
      .select('workouts.workout_date, max(supersets.weight)')
      .group('workouts.workout_date')
  end
end
