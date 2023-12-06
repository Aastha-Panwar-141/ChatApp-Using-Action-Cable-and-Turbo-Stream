import consumer from "./consumer"

const chatChannel = consumer.subscriptions.create({channel: "ChatChannel",room: "Best Room" }, {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to ChatChannel");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // data => { sent_by: "Aastha", body: "This is a cool chat app." }
    this.appendLine(data)
    // Called when there's incoming data on the websocket for this channel
    console.log("Received data:", data);
  },

  appendLine(data) {
    const html = this.createLine(data)
    const element = document.querySelector("[data-chat-room='Best Room']")
    element.insertAdjacentHTML("beforeend", html)
  },

  createLine(data) {
    return `
      <article class="chat-line">
        <span class="speaker">${data["sent_by"]}</span>
        <span class="body">${data["body"]}</span>
      </article>
    `
  }

});

chatChannel.send({ sent_by: "Aastha", body: "This is a cool chat app." })


// consumer.subscriptions.create({ channel: "ChatChannel", room: "1st Room" })

