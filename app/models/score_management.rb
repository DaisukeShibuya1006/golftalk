class ScoreManagement < ApplicationRecord
  with_options presence: true do
    validates :when
    validates :course
    validates :stroke
  end
  belongs_to :user

  def user
    User.find_by(id: uid)
  end
end
