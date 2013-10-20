class User < ActiveRecord::Base
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :workouts,
    inverse_of: :user

  has_many :exercises,
    inverse_of: :user

  PRIVACY = %w{private public}

  validates_presence_of :username
  validates_presence_of :email
  validates_presence_of :password, on: :create
  validates_presence_of :password_confirmation, on: :create
  validates_presence_of :account_privacy

  validates_inclusion_of :account_privacy, in: PRIVACY

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

  def greeting
    if first_name.present?
      first_name
    else
      username
    end
  end

  def username_requirements
    if username.present? and not username.match(/^[\w]+$/)
      errors.add :username, "can only include letters, numbers, underscores"
    end
  end
end
