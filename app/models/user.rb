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
  validates :password, length: {minimum: 8, maximum: 30}, on: :create

  before_save :generate_slug!

  def to_param
    sanitize_for_url
  end

  def generate_slug!
    uniq_slug = sanitize_for_url
    user = User.find_by(slug: uniq_slug)
    uniq_id = 2

    while user && user != self
      uniq_slug = append_suffix(uniq_slug, uniq_id)
      user = User.find_by(slug: uniq_slug)
      uniq_id += 1
    end

    self.slug = uniq_slug
  end

  def append_suffix(slug, id)
    if slug.split('-').last.to_i != 0
      slug = slug.slice(0...-1)
    end

    "#{slug}-#{id}"
  end

  def sanitize_for_url
    str = self.username
    str.strip.gsub(/\s+/, '-').gsub(/-+/, '-').gsub(/-+\z/, '').gsub(/\A-+/, '')
  end
end

