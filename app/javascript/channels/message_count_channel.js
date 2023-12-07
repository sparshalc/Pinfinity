import consumer from "./consumer"

consumer.subscriptions.create("MessageCountChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    const user_id = document.querySelectorAll('#user-id')

    const bottom_flash = document.getElementById('btn-flash')

    const bottom_flash_message = document.getElementById('btn-flash-msg')
    
    if(data.message_user_id.user_id != user_id[0].innerHTML){
      bottom_flash_message.innerHTML = `${data.user.email} messaged on ${data.room}`
      bottom_flash.classList.add('active')
      
      setTimeout(()=>{
        bottom_flash.classList.remove('active')
      }, 3000)
    }
    const message_count = document.getElementById(`message_count_${data.message_user_id.user_id}`)
    message_count.innerHTML = data.message

  }
});
