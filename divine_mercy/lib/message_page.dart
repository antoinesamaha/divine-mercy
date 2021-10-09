import 'package:divine_mercy/user_state.dart';
import 'package:flutter/material.dart';

import 'messages.dart';

class MessagePage extends StatelessWidget {
  int index = UserState().messageIndex;

  @override
  Widget build(BuildContext context) {
    return
        //Container(
        // decoration: BoxDecoration(
        //     color: Colors.black87,
        //     image: DecorationImage(
        //         image: AssetImage("assets/images/divine_mercy_1934.jpg"),
        //         fit: BoxFit.scaleDown)),
        //child:
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: Text("Message " + index.toString()),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  Text(
                    Messages().getMessage(index),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16,
                        //color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ])));
    //);
  }
}
