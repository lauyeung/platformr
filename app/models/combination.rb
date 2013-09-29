class Combination < ActiveRecord::Base
  has_many :supersets,
    inverse_of: :combination

  has_many :exercises, through: :supersets

  accepts_nested_attributes_for :supersets

  belongs_to :workout,
    inverse_of: :combinations
end
