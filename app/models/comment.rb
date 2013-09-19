class Comment < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :comment

  belongs_to :workout,
    inverse_of: :comment
end
