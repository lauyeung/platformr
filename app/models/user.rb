class User < ActiveRecord::Base
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :workouts

  has_many :exercises

  validates_presence_of :username
  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :password_confirmation

  validates_uniqueness_of :username, :case_sensitive => false, :message => "has already been taken"
  validates_uniqueness_of :email, :case_sensitive => false, :message => "has already been taken"

# VALIDATES UNIQUENESS OF USERNAME AND PASSWORD

  validate :username_requirements

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
  end

  def username_requirements
    if username.present? and not username.match(/^[\w]+$/)
      errors.add :username, "can only include letters, numbers, underscores"
    end
  end
end
