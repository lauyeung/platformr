class Exercise < ActiveRecord::Base
  has_many :exercise_sets,
    inverse_of: :exercise

  belongs_to :user

  validates_presence_of :name
  validates_presence_of :user

  validates_uniqueness_of :name, :case_sensitive => false, :message => "already exists"

end
