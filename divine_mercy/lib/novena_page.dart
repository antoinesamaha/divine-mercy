import 'package:divine_mercy/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import 'messages.dart';
import 'novena/novena_days_prayer.dart';

class NovenaPage extends StatefulWidget {
  int randomIndex = 0;

  NovenaPage({Key? key}) : super(key: key) {}

  @override
  _NovenaPageState createState() => _NovenaPageState();
}

class _NovenaPageState extends State<NovenaPage> {
  String _htmlText(int fontSize, bool bold, String text) {
    String boldSection = bold ? "font-weight: bold;" : "";
    return "<div style=\"" +
        boldSection +
        "color:black;font-size:" +
        fontSize.toString() +
        "px;\">" +
        text +
        "</div></br>";
  }

  @override
  Widget build(BuildContext context) {
    double textWidth = MediaQuery.of(context).size.width * 0.8;

    return Consumer<UserState>(
      builder: (context, userState, child) => GestureDetector(
          onHorizontalDragEnd: (dragEndDetails) {
            if (dragEndDetails.primaryVelocity! < 0.0) {
              // Page forwards
              print('Next novena day');
              Provider.of<UserState>(context, listen: false).nextNovenaDay();
            } else if (dragEndDetails.primaryVelocity! > 0) {
              // Page backwards
              print('Previous novena day');
              Provider.of<UserState>(context, listen: false)
                  .previousNovenaDay();
            }
          },
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.redAccent,
                title: Text(
                    "Novena day " + userState.currentNovenaDay().toString()),
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
                          data: _htmlText(userState.fontSize + 3, true,
                                  "Introduction") +
                              _htmlText(
                                  userState.fontSize,
                                  false,
                                  (DMNovenaDays.getIntroduction(
                                      userState.currentNovenaDay()))) +
                              _htmlText(userState.fontSize + 3, true,
                                  "Prayer to Jesus") +
                              _htmlText(
                                  userState.fontSize,
                                  false,
                                  (DMNovenaDays.getPrayerToJesus(
                                      userState.currentNovenaDay()))) +
                              _htmlText(userState.fontSize + 3, true,
                                  "Prayer to the Father") +
                              _htmlText(
                                  userState.fontSize,
                                  false,
                                  (DMNovenaDays.getPrayerToTheFather(
                                      userState.currentNovenaDay()))),
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
                            .previousNovenaDay();
                      },
                      child: Icon(Icons.navigate_before),
                    ),
                    FloatingActionButton(
                      heroTag: "next",
                      onPressed: () {
                        Provider.of<UserState>(context, listen: false)
                            .nextNovenaDay();
                      },
                      child: Icon(Icons.navigate_next),
                    )
                  ],
                ),
              ))),
    );
    //);
  }
}
