class Workout < ActiveRecord::Base
  has_many :combinations,
    inverse_of: :workout,
    dependent: :destroy

  has_many :supersets, through: :combinations

  accepts_nested_attributes_for :combinations,
    reject_if: proc { |a| a[:sets].blank? },
    allow_destroy: true

  belongs_to :user,
    inverse_of: :workouts

  validates_presence_of :workout_date
end
