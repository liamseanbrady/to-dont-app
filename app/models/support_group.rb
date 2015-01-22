class SupportGroup < ActiveRecord::Base
  has_many :memberships
  has_many :participants, through: :memberships, source_type: 'SupportGroup', source: :user

  validates :name, length: { minimum: 5, maximum: 20 }, uniqueness: true
  validates :moderator, presence: true
end