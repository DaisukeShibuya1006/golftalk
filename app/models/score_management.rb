class ScoreManagement < ApplicationRecord
  with_options presence: true do
    validates :date
    validates :course
    validates :stroke
  end
  belongs_to :user

  def user
    User.find_by(id: uid)
  end

   default_scope -> { order(created_at: :desc) }
end
