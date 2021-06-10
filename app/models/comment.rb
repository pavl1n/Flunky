# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  after_create_commit { RenderCommentJob.perform_later self }
  validates :body, presence: true, allow_blank: false
end
