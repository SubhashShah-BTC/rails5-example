# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class CommentsChannel < ApplicationCable::Channel

  # Added manually, not generated with rails generator
  def self.broadcast(comment)
    broadcast_to comment.post, comment:
      CommentsController.render(partial: "comments/comment", locals: { comment: comment })
    # Above is the new way of rendering templates outside of the controller
    # This can be used to render HTML oustide of controller
  end

  def subscribed
    # For the sake of example, this will broadcast on the last post
    stream_for Post.last
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
