class User < ApplicationRecord
  has_many :auth_providers, dependent: :destroy
end
