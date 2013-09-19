class Superset < ActiveRecord::Base
  has_many :exercise_sets,
    inverse_of: :Superset

  belongs_to :workout,
    inverse_of: :supersets


end
