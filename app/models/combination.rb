class Combination < ActiveRecord::Base
  has_many :supersets,
    inverse_of: :combination,
    dependent: :destroy

  has_many :exercises, through: :supersets

  accepts_nested_attributes_for :supersets

  belongs_to :workout,
    inverse_of: :combinations

  validates_presence_of :sets
  validates_presence_of :sets_complete

  validates_numericality_of :sets, only_integer: true, greater_than_or_equal_to: 0
  validates_numericality_of :sets_complete, only_integer: true, greater_than_or_equal_to: 0

end
