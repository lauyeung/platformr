class Exercise < ActiveRecord::Base

  has_many :exercise_sets,
    inverse_of: :exercise

  belongs_to :user

  validates_presence_of :name
  validates_presence_of :user

  validates_uniqueness_of :name, :case_sensitive => false, :message => "already exists"

  before_destroy :check_exercise_not_in_use

  def check_exercise_not_in_use
    self.exercise_sets.empty?
  end

  def self.exercise_set_count(user)
    joins('JOIN exercise_sets ON exercises.id = exercise_sets.exercise_id')
      .where('exercises.user_id = ?', user.id)
      .select('exercises.name')
  end

end
