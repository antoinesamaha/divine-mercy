import 'package:divine_mercy/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import 'messages.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    // double textWidth = MediaQuery.of(context).size.width * 0.8;

    return Consumer<UserState>(
      builder: (context, userState, child) => GestureDetector(
          onHorizontalDragEnd: (dragEndDetails) {
            if (dragEndDetails.primaryVelocity! < 0.0) {
              // Page forwards
              print('Move page forwards');
              Provider.of<UserState>(context, listen: false).nextPage();
            } else if (dragEndDetails.primaryVelocity! > 0) {
              // Page backwards
              print('Move page backwards');
              Provider.of<UserState>(context, listen: false).previousPage();
            }
          },
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                  backgroundColor: Colors.redAccent,
                  iconTheme: IconThemeData(color: Colors.white),
                  title: Row(children: <Widget>[
                    Text(
                        "Message  " +
                            (userState.randomMode
                                ? userState.randomIndex.toString()
                                : userState.messageIndex.toString()),
                        style: TextStyle(color: Colors.white)),
                    SizedBox(width: 10),
                    !userState.randomMode
                        ? SizedBox(width: 1)
                        : TextButton.icon(
                            icon: const Icon(Icons.bookmark_border,
                                color: Colors.white),
                            label: const Text('Make current',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Make Current'),
                                    content: Text(
                                        'Set message ${userState.randomIndex} as your current message?'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Cancel'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('Confirm'),
                                        onPressed: () {
                                          userState.messageIndex =
                                              userState.randomIndex;
                                          userState.randomMode = false;
                                          userState.save();
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => SettingsScreen()));
                            })
                  ])),
              body: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 30.0),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                          child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SelectionArea(
                            child: Html(
                          data: "<div style=\"color:black;font-size:" +
                              userState.fontSize.toString() +
                              "px;\">" +
                              (userState.randomMode
                                  ? Messages().getMessage(
                                      context, userState.randomIndex)
                                  : Messages().getMessage(
                                      context, userState.messageIndex)) +
                              "</div>",
                        )),
                        /*
                            Text(
                              Messages().getMessage(userState.messageIndex),
                              textAlign: TextAlign.left,
                              //overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 18,
                                  //color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )*/
                      ))
                    ],
                  ))),
              bottomNavigationBar: BottomAppBar(
                color: Colors.redAccent,
                child: Container(
                  height: 50,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FloatingActionButton(
                      heroTag: "previous",
                      backgroundColor: Colors.redAccent,
                      onPressed: () {
                        Provider.of<UserState>(context, listen: false)
                            .previousPage();
                      },
                      child: Icon(Icons.navigate_before, color: Colors.white),
                    ),
                    FloatingActionButton(
                      heroTag: "next",
                      backgroundColor: Colors.redAccent,
                      onPressed: () {
                        Provider.of<UserState>(context, listen: false)
                            .nextPage();
                      },
                      child: Icon(Icons.navigate_next, color: Colors.white),
                    )
                  ],
                ),
              ))),
    );
    //);
  }
}
