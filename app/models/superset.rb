class Superset < ActiveRecord::Base
  has_many :exercise_sets,
    inverse_of: :superset

  accepts_nested_attributes_for :exercise_sets

  belongs_to :combination,
    inverse_of: :supersets




end
