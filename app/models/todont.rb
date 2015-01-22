class Todont < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'

  validates :body, length: {minimum: 3, maximum: 60}
  validates :visibility, inclusion: { in %w(private, public) }
end