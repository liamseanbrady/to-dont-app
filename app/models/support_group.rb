class SupportGroup < ActiveRecord::Base
  include Sluggable

  has_many :memberships, as: :joinable
  has_many :participants, through: :memberships, source: :user
  belongs_to :moderator, class_name: "User"

  validates :name, length: { minimum: 5, maximum: 20 }, uniqueness: true
  validates :moderator, presence: true

  sluggable_column :name
end
