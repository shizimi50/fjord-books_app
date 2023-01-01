# frozen_string_literal: true

class Report < ApplicationRecord
  validates :title, :description, presence: true
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user
end
