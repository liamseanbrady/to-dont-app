class ProgressLog < ActiveRecord::Base
  belongs_to :todont

  validates :message, length: { minimum: 6, maximum: 100 }
  validates :mood, inclusion: { in: %w(motivated sad zapped happy excited) }
end