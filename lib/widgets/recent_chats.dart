import 'package:chat_ui_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../models/message_model.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  ChatTile(
                    senderName: chats[index].sender.name,
                    senderImageurl: chats[index].sender.imageUrl,
                    textMessage: chats[index].text,
                    time: chats[index].time,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ChatTile extends StatefulWidget {
  final String senderName;
  final String senderImageurl;
  final String textMessage;
  final String time;

  const ChatTile(
      {Key key,
      this.senderName,
      this.senderImageurl,
      this.textMessage,
      this.time})
      : super(key: key);

  @override
  _ChatTileState createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Theme.of(context).accentColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage(widget.senderImageurl),
                  radius: 30,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.senderName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    width: deviceWidth * 0.53,
                    child: Text(
                      widget.textMessage,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 20, 12),
                child: Text(widget.time),
              ),
              Text("NEW"),
            ],
          ),
        ],
      ),
    );
  }
}
