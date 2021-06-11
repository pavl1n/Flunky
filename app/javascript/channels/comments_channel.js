import consumer from "./consumer";

consumer.subscriptions.create("CommentsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $('.new_comments').prepend('<div class="comment">'+ '[ ' + new Date(data.content.created_at).toLocaleTimeString() + ']' + data.user.name + ': ' + data.content.body + '</div>');
    $('#comment_body').val(' ');
  }
});
