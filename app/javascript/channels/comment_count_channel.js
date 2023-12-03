import consumer from "./consumer"

consumer.subscriptions.create("CommentCountChannel", {
  connected() {
  },
  
  disconnected() {
  },
  
  received(data) {
    const pin_id = data.pin_id
    const recieved_comment = document.getElementById(`pin_${pin_id}`)
    recieved_comment.innerHTML = `${data.comment} comments`
  }
});
