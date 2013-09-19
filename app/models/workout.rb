class Workout < ActiveRecord::Base
  has_many :supersets,
    inverse_of: :workout

  belongs_to :user,
    inverse_of: :workouts
end
