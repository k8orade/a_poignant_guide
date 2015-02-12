class Material < ActiveRecord::Base
  DIFFICULTIES = {
    'beginner'     => 'No coding experience required.',
    'intermediate' => 'You can explain the difference between HTML, CSS, Ruby and Rails.',
    'advanced'     => 'You can build a blog app in Rails without a tutorial.'
  }

  validates :name, uniqueness: { scope: :source }
  validates :difficulty, inclusion: { in: DIFFICULTIES.keys }
  validates :name,
            :source,
            :description,
            :duration,
            :difficulty,
            presence: true
end
