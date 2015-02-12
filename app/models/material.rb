class Material < ActiveRecord::Base
  DIFFICULTIES = {
    'beginner'     => 'No coding experience required.',
    'intermediate' => 'You can explain the difference between HTML, CSS, Ruby and Rails.',
    'advanced'     => 'You can build a blog app in Rails without a tutorial.'
  }

  validates :name, uniqueness: { scope: :source }
  validates :difficulty, inclusion: { in: DIFFICULTIES.keys }
  validates :source, :format => URI::regexp(%w(http https))
  validates :name,
            :source,
            :description,
            :duration,
            :difficulty,
            presence: true

  default_scope { order(:name, :source) }
end
