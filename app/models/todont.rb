class Todont < ActiveRecord::Base
  include Sluggable

  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :progress_logs
  has_many :success_days

  validates :body, length: {minimum: 3, maximum: 60}
  validates :visibility, inclusion: { in: %w(private public) }

  sluggable_column :body
end