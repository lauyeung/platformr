class Workout < ActiveRecord::Base
  has_many :combinations,
    inverse_of: :workout,
    dependent: :destroy

  has_many :supersets, through: :combinations

  accepts_nested_attributes_for :combinations,
    reject_if: proc { |a| a[:sets].blank?; },
    allow_destroy: true

  belongs_to :user,
    inverse_of: :workouts

  validates_presence_of :workout_date
  validates_presence_of :user
  validate :combination_exercise?
  validate :combinations?

  def combinations?
    if !combinations.any?
      errors.add(:workout, "You must have at least one set!")
    end
  end

  def combination_exercise?
    if combinations.any?
      if !combinations.first.supersets.first.exercise_sets.any?
        errors.add(:workout, "You must have at least one exercise!")
      end
    end
  end
end
