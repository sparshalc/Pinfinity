import consumer from "./consumer"

consumer.subscriptions.create("NotificationCountChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    const user_id = document.querySelectorAll('#user-id')
    const bottom_flash = document.getElementById('btn-flash')
    const bottom_flash_message = document.getElementById('btn-flash-msg')

    if(user_id[0].innerHTML == data.pin_user){
        const notification_count = document.getElementById(`notification_count_${data.pin_user}`)
        notification_count.innerHTML = data.notifications
        bottom_flash_message.innerHTML = `<i class="bi bi-chat-square-text-fill"></i> <strong>${data.user.email}</strong> commented on your post (${data.pin_id})`
        bottom_flash.classList.add('active')
        
        setTimeout(()=>{
          bottom_flash.classList.remove('active')
        }, 3000)
    }
  }
});
