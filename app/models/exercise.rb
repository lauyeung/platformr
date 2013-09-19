class Exercise < ActiveRecord::Base
  has_many :exercise_sets,
    inverse_of: :exercise

  validates_presence_of :name

  validates_uniqueness_of :name, :case_sensitive => false, :message => "already exists"

end
