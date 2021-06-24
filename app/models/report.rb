# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :comments, as: :commentable, dependent: :destroy
end
