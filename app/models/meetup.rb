class Meetup < ActiveRecord::Base
  include Sluggable

  belongs_to :organizer, class_name: 'User'

  has_many :attendee_memberships, as: :joinable, class_name: "Membership"
  has_many :attendees, through: :attendee_memberships, source: :user

  validates :title, length: { minimum: 5, maximum: 20 }
  validates :description, length: { minimum: 10, maximum: 200 }
  validates :duration, inclusion: { in: [1, 2, 3, 4, 5, 6, 7] }
  validates :location, length: { minimum: 3, maximum: 60 }
  validates :event_date, presence: true

  sluggable_column :title
end