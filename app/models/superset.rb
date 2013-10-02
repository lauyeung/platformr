class Superset < ActiveRecord::Base
  has_many :exercise_sets,
    inverse_of: :superset

  accepts_nested_attributes_for :exercise_sets,
    reject_if: proc { |a| a[:reps].blank? },
    allow_destroy: true

  belongs_to :combination,
    inverse_of: :supersets




end
