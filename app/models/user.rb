# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :confirmable,
         :timeoutable,
         :recoverable,
         :registerable,
         :rememberable,
         :lockable,
         sign_in_after_reset_password: false

  validates :email, uniqueness: { case_sensitive: false }

  validates :email,
            format:      { with: Devise.email_regexp },
            allow_blank: true

  validates :password,
            length:       { minimum: 8 },
            confirmation: true,
            allow_blank:  true

  validates :password,
            presence: true
end
