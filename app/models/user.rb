class User < ActiveRecord::Base
  has_secure_password validations: false

  has_many :todonts
  has_many :progress_logs, through: :todonts, source: :progress_logs

  has_many :support_group_memberships, class_name: 'Membership'
  has_many :support_groups, through: :support_group_memberships, source: :joinable, source_type: 'SupportGroup'

  has_many :meetup_memberships, class_name: "Membership"
  has_many :meetups_scheduled, through: :meetup_memberships, source: :joinable, source_type: 'Meetup'

  has_many :organized_meetups, foreign_key: 'organizer_id', class_name: 'Meetup'

  validates :username, length: {minumum: 3, maximum: 20}, uniqueness: true
  validates :password, length: {minimum: 8, maximum: 30}
end