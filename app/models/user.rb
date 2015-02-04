class User < ActiveRecord::Base
  include Gravatarable
  include Sluggable

  attr_accessor :password_confirm

  has_secure_password validations: false

  has_many :todonts
  has_many :public_todonts, -> { where visibility: 'public' }, class_name: 'Todont'
  has_many :progress_logs, through: :todonts, source: :progress_logs

  has_many :support_group_memberships, class_name: 'Membership'
  has_many :support_groups, through: :support_group_memberships, source: :joinable, source_type: 'SupportGroup'

  has_many :meetup_memberships, class_name: "Membership"
  has_many :meetups_scheduled, through: :meetup_memberships, source: :joinable, source_type: 'Meetup'

  has_many :organized_meetups, foreign_key: 'organizer_id', class_name: 'Meetup'

  validates :username, length: {minumum: 3, maximum: 20}, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: {minimum: 8, maximum: 30}, on: :create
  validate :password_confirm_must_match_password

  gravatar_column :email
  sluggable_column :username

  before_save :generate_slug!

  def password_confirm_must_match_password
    if password != password_confirm
      errors.add(:password, 'confirmation does not match password.')
    end
  end
end

