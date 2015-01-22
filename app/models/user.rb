class User < ActiveRecord::Base
  has_secure_password validations: false

  has_many :todonts
  has_many :progress_logs, through: :todonts, source: :progress_logs

  validates :username, length: {minumum: 3, maximum: 20}
  validates :password, length: {minimum: 8, maximum: 30}
end