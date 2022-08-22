# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  paginates_per 10

  VALID_ZIPCODE_REGEX = /\A\d{3}-\d{4}$|^\d{3}-\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/.freeze

  validates :name, presence: true
  validates :zipcode, presence: true, format: { with: VALID_ZIPCODE_REGEX }
  validates :address, presence: true
  validates :profile, presence: true
end
