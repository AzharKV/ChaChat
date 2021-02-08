import 'package:chat_with_firebase/Components/Constant.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'WelcomeScreen.dart';
final _auth = FirebaseAuth.instance;
final _fireStore = FirebaseFirestore.instance;
User loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = "ChatScreen";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String messageText;
  final messageController = TextEditingController();

  void getUser() async {
    try {
      if (_auth != null) {
        loggedInUser = _auth.currentUser;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("⚡ FlashChat", style: TextStyle(fontStyle: FontStyle.italic)),
        leading: SizedBox(),
        actions: [
          IconButton(
              icon: Icon(Icons.logout, color: Colors.white),
              onPressed: () async {
                await _auth.signOut();
                Navigator.pushNamed((context), WelcomeScreen.id);
              })
        ],
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            MessageStream(),
            Container(
              decoration: kMessageContainer,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextField,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      messageController.clear();
                      await _fireStore.collection("messages").add({
                        "text": messageText,
                        "user": loggedInUser.email,
                        "time": FieldValue.serverTimestamp(),
                      }).whenComplete(() => print("Completed"));
                    },
                    icon: Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _fireStore.collection("messages").limit(10).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        var messages = snapshot.data.docs.reversed;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final String messageText = message.data()["text"];
          final String messageSender = message.data()["user"];
          final Timestamp messageTime = message.data()["time"] as Timestamp;
          final currentUser = loggedInUser.email;

          final messageBubble = MessageBubble(
            messageText: messageText,
            messageSender: messageSender,
            isMe: currentUser == messageSender,
            time: messageTime,
          );
          messageBubbles.add(messageBubble);
          messageBubbles
              .sort((a, b) => b.time.toString().compareTo(a.time.toString()));
        }

        return Expanded(
          child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              children: messageBubbles),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.messageText, this.messageSender, this.isMe, this.time});

  final String messageText;
  final bool isMe;
  final String messageSender;
  final Timestamp time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isMe
          ? const EdgeInsets.only(bottom: 10.0, left: 100.0)
          : const EdgeInsets.only(bottom: 10.0, right: 100.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            messageSender,
            style: TextStyle(fontSize: 11.0),
          ),
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isMe ? 30.0 : 0.0),
                bottomLeft: Radius.circular(30.0),
                topRight: Radius.circular(isMe ? 0.0 : 30.0),
                bottomRight: Radius.circular(30.0)),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 20.0),
              child: Text(
                messageText,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: isMe ? Colors.white : Colors.black, fontSize: 17.0),
              ),
            ),
          ),
          // Text(
          //   time.toDate().toString(),
          //   textAlign: isMe ? TextAlign.right : TextAlign.left,
          // )
        ],
      ),
    );
  }
}
