# frozen_string_literal: false

# Dynamic comments
class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'comments_channel'
  end

  def unsubscribed; end
end
