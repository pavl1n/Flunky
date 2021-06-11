import consumer from "./consumer"

consumer.subscriptions.create("CommentsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)

    $('.new_comments').prepend('<div class="comment">'+ "<%= j render #{@comment}%>" + data.content.body + '</div>');
    $('#comment_body').val(' ');
  }
});
