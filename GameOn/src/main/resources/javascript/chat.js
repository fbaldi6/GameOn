// DOM Elements
let chatBox = document.getElementById("chatBox");
let messageInput = document.getElementById("usermsg");
let sendButton = document.getElementById("sendButton");

/**
 * Functions that sends a chat message to the opponent when the sendButton is clicked
 */
sendButton.onclick = function () {
    let p = document.createElement("P");
    let text = document.createTextNode(username + ": " + messageInput.value);
    p.appendChild(text);
    p.className = "message-right";
    chatBox.appendChild(p);

    // send the message
    let message = new Message("chat_message", messageInput.value, username, opponentUsername);
    sendWebSocket(message);

    messageInput.value=''; // clear the input for the message
}
