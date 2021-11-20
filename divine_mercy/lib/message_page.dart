import 'dart:math';

import 'package:divine_mercy/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import 'messages.dart';

class MessagePage extends StatefulWidget {
  final bool random;

  const MessagePage({this.random: false, Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

/*
class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    double textWidth = MediaQuery.of(context).size.width * 0.8;

    return Consumer<UserState>(
        builder: (context, userState, child) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.redAccent,
                title: Text("Message " + userState.messageIndex.toString()),
              ),
              body: Text(
                "Hello",
                textAlign: TextAlign.left,
                //overflow: TextOverflow.ellipsis,
              ),
              bottomNavigationBar: BottomAppBar(
                color: Colors.redAccent,
                child: Container(
                  height: 50,
                ),
              ),
              /*
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: "previous",
                    onPressed: () {
                      Provider.of<UserState>(context, listen: false)
                          .previousPage();
                    },
                    child: Icon(Icons.navigate_before),
                  ),
                  FloatingActionButton(
                    heroTag: "next",
                    onPressed: () {
                      Provider.of<UserState>(context, listen: false).nextPage();
                    },
                    child: Icon(Icons.navigate_next),
                  )
                ],
              ),
            )*/
            ));
    //);
  }
}
*/

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    double textWidth = MediaQuery.of(context).size.width * 0.8;

    var randomGenerator = new Random();
    int randomIndex = randomGenerator.nextInt(1800);

    return Consumer<UserState>(
        builder: (context, userState, child) => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.redAccent,
              title: Text("Message " +
                  (widget.random
                      ? randomIndex.toString()
                      : userState.messageIndex.toString())),
            ),
            body: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 30.0),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                        child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SelectableHtml(
                        data: "<div style=\"color:black;font-size:" +
                            userState.fontSize.toString() +
                            "px;\">" +
                            (widget.random
                                ? Messages().getMessage(randomIndex)
                                : Messages()
                                    .getMessage(userState.messageIndex)) +
                            "</div>",
                      ),
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
                    onPressed: () {
                      Provider.of<UserState>(context, listen: false)
                          .previousPage();
                    },
                    child: Icon(Icons.navigate_before),
                  ),
                  FloatingActionButton(
                    heroTag: "next",
                    onPressed: () {
                      Provider.of<UserState>(context, listen: false).nextPage();
                    },
                    child: Icon(Icons.navigate_next),
                  )
                ],
              ),
            )));
    //);
  }
}
