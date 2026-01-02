import 'package:divine_mercy/message_page.dart';
import 'package:divine_mercy/user_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiaryCard extends StatefulWidget {
  bool random;

  DiaryCard({Key? key, this.random = false}) : super(key: key);

  @override
  _DiaryCard createState() => _DiaryCard();
}

class _DiaryCard extends State<DiaryCard> {
  void navigatorPushMessage(UserState userState) {
    if (widget.random) {
      userState.randomMode = true;
    } else {
      userState.randomMode = false;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MessagePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserState>(
        builder: (context, userState, child) => Card(
              elevation: 0,
              color: Colors.transparent.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  side: BorderSide(width: 2, color: Colors.redAccent)),
              child: ListTile(
                title: Text(
                    widget.random
                        ? "Diary Random message"
                        : "Diary message " + userState.messageIndex.toString(),
                    style: TextStyle(color: Colors.white)),
                //Text("St Faustina's Diary",
                //style: TextStyle(color: Colors.white.withOpacity(0.8))),
                // subtitle: Text("Divine Mercy In My Saul",
                //     style: TextStyle(color: Colors.white.withOpacity(0.6))),
                onTap: () => {
                  navigatorPushMessage(userState)
                  //   if (widget.random)
                  //     {
                  //       navigatorPushMessage(userState);
                  //     }
                  //   else
                  //     {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(builder: (context) => MessagePage()),
                  //       )
                  //     }
                },
                /*
                trailing:
                    Text(
                        widget.random
                            ? "Random message"
                            : "Next message #" +
                                userState.messageIndex.toString(),
                        style: TextStyle(color: Colors.white)),
                        */
              ),
            ));
  }
}
