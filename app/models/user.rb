# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :validatable, :database_authenticatable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  def token_generate
    payload = {
      sub: id,
      scp: 'user',
      jti: SecureRandom.uuid
    }
    Warden::JWTAuth::TokenEncoder.new.call(payload)
  end
end
