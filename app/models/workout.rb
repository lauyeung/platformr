class Workout < ActiveRecord::Base
  has_many :combinations,
    inverse_of: :workout

  has_many :supersets, through: :combinations

  accepts_nested_attributes_for :combinations

  belongs_to :user,
    inverse_of: :workouts

  validates_presence_of :workout_date

end
