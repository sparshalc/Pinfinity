import consumer from "./consumer"

consumer.subscriptions.create("NotificationCountChannel", {
  connected() {
    console.log("Connected to notification count channel")
  },

  disconnected() {
  },

  received(data) {
    const user_id = document.querySelectorAll('#user-id')
    if(user_id[0].innerHTML == data.pin_user){
        const notification_count = document.getElementById(`notification_count_${data.pin_user}`)
        notification_count.innerHTML = data.notifications
    }
  }
});
