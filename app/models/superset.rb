class Superset < ActiveRecord::Base

  has_many :exercise_sets,
    inverse_of: :superset,
    dependent: :destroy

  accepts_nested_attributes_for :exercise_sets,
    reject_if: proc { |a| a[:reps].blank? },
    allow_destroy: true

  belongs_to :combination,
    inverse_of: :supersets

  validates_presence_of :combination

  validates_numericality_of :weight, if: "!weight.nil?"
  validates_inclusion_of :weight, :in => 1..10000, if: "!weight.nil?"


end
