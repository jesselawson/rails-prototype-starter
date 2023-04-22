class User < ApplicationRecord
  has_secure_password

  # any chars that are not a space or @ before @, one @, then the same
  # validation on right hand
  validates :email,
            presence: true,
            format: {
              with: /\A[^@\s]+@[^@\s]+\z/,
              message: "must be a valid email"
            }
end
