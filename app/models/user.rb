class User < ActiveRecord::Base
  has_secure_password validations: false

  has_many :todonts
end