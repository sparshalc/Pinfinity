import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    console.log("Connected")
  },

  disconnected() {
  },

  received(data) {
    const room_id = data.room_id
    const new_name = data.room_name
    const title = document.getElementById(`name_room_${room_id}`)
    if(title){
      title.innerHTML = new_name
    }
  }
});
