import 'package:chat_ui_flutter/models/message_model.dart';
import 'package:flutter/material.dart';

class FavouritesContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Favourite Contacts",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () => print("more"),
              ),
            ],
          ),
        ),
        Container(
          height: 120,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: favorites.length,
              itemBuilder: (BuildContext context, index) {
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(
                          favorites[index].imageUrl,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      favorites[index].name,
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
