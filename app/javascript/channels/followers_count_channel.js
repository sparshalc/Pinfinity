import consumer from "./consumer"

consumer.subscriptions.create("FollowersCountChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    const user_id = document.querySelectorAll('#user-id')
    const bottom_flash = document.getElementById('btn-flash')
    const bottom_flash_message = document.getElementById('btn-flash-msg')
    console.log(data.follow.length);


    if(user_id[0].innerHTML == data.user){
        const follow_count = document.getElementById(`follow_count_${data.user}`)
        follow_count.innerHTML = data.follow.length

        bottom_flash_message.innerHTML = `${data.following_user.email} ${data.message}`
        bottom_flash.classList.add('active')
        
        setTimeout(()=>{
          bottom_flash.classList.remove('active')
        }, 3000)
    }
  }
});
